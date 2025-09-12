import 'package:bloc/bloc.dart';
import 'package:cinerina/feature/favorites/data/favorites_repository.dart';
import 'package:cinerina/feature/favorites/model/favorites_model.dart';
import 'package:meta/meta.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesRepository _favoritesRepository;

  FavoritesBloc({required FavoritesRepository favoritesRepository})
    : _favoritesRepository = favoritesRepository,
      super(FavoritesInitial()) {
    on<FavoritesEvent>((event, emit) => switch(event){
      LoadFavorites() => _loadFavorites(event, emit),
      // DeleteFavorite() => _deleteFavorites(event, emit),
      // ResetFavorites() => _loadFavorites(event, emit),
    });
  }

//     Future<void> _deleteFavorite(
//     DeleteFavorite event,
//     Emitter<FavoritesState> emit,
//   ) async {
//     try {
//       emit(FavoritesLoading());
//       final favoritesList = await _favoritesRepository.resetFavorites();
//       emit(FavoritesInitial());    } on Object catch (e) {
//       emit(FavoritesError(e));
//     }
//   }
// }


  Future<void> _loadFavorites(
    LoadFavorites event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      emit(FavoritesLoading());
      final favoritesList = await _favoritesRepository.getFavorites();
      emit(FavoritesLoaded(favoritesList: favoritesList));
    } on Object catch (e) {
      emit(FavoritesError(e));
    }
  }
}
