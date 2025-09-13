import 'package:bloc/bloc.dart';
import 'package:cinerina/core/bloc/bloc_transformer.dart';
import 'package:cinerina/feature/favorites/data/favorites_repository.dart';
import 'package:cinerina/feature/favorites/model/favorites_model.dart';
import 'package:meta/meta.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository _favoritesRepository;

  FavoritesBloc({required FavoritesRepository favoritesRepository})
    : _favoritesRepository = favoritesRepository,
      super(FavoritesInitial()) {
    on<FavoritesEvent>(
      (event, emit) => switch (event) {
        LoadFavorites() => _loadFavorites(event, emit),
        AddFavorite() => _addFavorite(event, emit),
        DeleteFavorite() => _deleteFavorite(event, emit),
        ToggleFavorite() => _toggleFavorite(event, emit),
        ResetFavorites() => _resetFavorites(event, emit),
      },
      transformer: BlocTransformer.sequential(),
    );
  }

  Future<void> _loadFavorites(
    LoadFavorites event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      emit(FavoritesLoading());
      final favoritesList = await _favoritesRepository.getFavorites();
      emit(FavoritesLoaded(favoritesList: favoritesList));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  Future<void> _addFavorite(
    AddFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is FavoritesLoaded) {
        final isAlreadyFavorite = await _favoritesRepository.isInFavorites(
          event.model?.movie?.id ?? DateTime.now().millisecondsSinceEpoch,
        );
        if (!isAlreadyFavorite) {
          await _favoritesRepository.addFavorites(event.model!);
          final updatedList = [...currentState.favoritesList, event.model!];
          emit(FavoritesLoaded(favoritesList: updatedList));
        }
      } else {
        await _favoritesRepository.addFavorites(event.model!);
        add(LoadFavorites());
      }
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  Future<void> _deleteFavorite(
    DeleteFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is FavoritesLoaded) {
        await _favoritesRepository.removeFromFavorites(
          event.model?.movie?.id ?? DateTime.now().millisecondsSinceEpoch,
        );
        final updatedList = currentState.favoritesList
            .where((item) => item.movie?.id != event.model?.movie?.id)
            .toList();
        emit(FavoritesLoaded(favoritesList: updatedList));
      } else {
        await _favoritesRepository.removeFromFavorites(
          event.model?.movie?.id ?? DateTime.now().millisecondsSinceEpoch,
        );
        add(LoadFavorites());
      }
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  Future<void> _toggleFavorite(
    ToggleFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      final currentState = state;
      final isInFavorites = await _favoritesRepository.isInFavorites(
        event.model?.movie?.id ?? DateTime.now().millisecondsSinceEpoch,
      );

      if (isInFavorites) {
        await _favoritesRepository.removeFromFavorites(
          event.model?.movie?.id ?? DateTime.now().millisecondsSinceEpoch,
        );
        if (currentState is FavoritesLoaded) {
          final updatedList = currentState.favoritesList
              .where((item) => item.movie?.id != event.model?.movie?.id)
              .toList();
          emit(FavoritesLoaded(favoritesList: updatedList));
        }
      } else {
        if (event.model != null) {
          await _favoritesRepository.addFavorites(event.model!);
          if (currentState is FavoritesLoaded) {
            final updatedList = [...currentState.favoritesList, event.model!];
            emit(FavoritesLoaded(favoritesList: updatedList));
          }
        }
      }
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  Future<void> _resetFavorites(
    ResetFavorites event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      emit(FavoritesLoading());
      await _favoritesRepository.resetFavorites();
      emit(FavoritesLoaded(favoritesList: []));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }
}
