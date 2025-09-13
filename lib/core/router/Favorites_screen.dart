import 'package:cinerina/feature/favorites/bloc/favorites_bloc.dart';
import 'package:cinerina/feature/initialization/widget/depend_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void didChangeDependencies() {
    DependScope.of(context).dependModel.favoritesBloc.add(LoadFavorites());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = DependScope.of(context).dependModel.favoritesBloc;

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        bloc: bloc,
        builder: (context, state) {
          return switch (state) {
            FavoritesInitial() => Center(child: Text('петух')),
            FavoritesLoading() => Center(child: CircularProgressIndicator()),
            FavoritesLoaded() => ListView.builder(
              itemCount: state.favoritesList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    IconButton(onPressed: (){
                      bloc.add(ResetFavorites());                    }, icon:Icon(Icons.delete)),
                    Divider(),
                    Text(state.favoritesList[index].name),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        bloc.add(
                          DeleteFavorite(model: state.favoritesList[index]),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            FavoritesError() => Center(child: Text('лох')),
          };
        },
      ),
    );
  }
}
