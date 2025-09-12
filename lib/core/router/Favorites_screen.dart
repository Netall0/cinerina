import 'package:cinerina/feature/favorites/bloc/favorites_bloc.dart';
import 'package:cinerina/feature/initialization/widget/depend_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        bloc: DependScope.of(context).dependModel.favoritesBloc,
        builder: (context, state) {
          return switch (state) {
            FavoritesInitial() => Center(child: Text('петух')),
            FavoritesLoading() => Center(child: CircularProgressIndicator()),
            FavoritesLoaded() => ListView.builder(
              itemCount: state.favoritesList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Divider(),
                    Text(state.favoritesList[index].name),
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
