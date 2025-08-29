import 'package:cinerina/feature/initialization/widget/depend_scope.dart';
import 'package:cinerina/feature/search/bloc/search_bloc.dart';
import 'package:cinerina/feature/search/data/i_search_repository.dart';
import 'package:cinerina/feature/search/data/search_repository.dart';
import 'package:cinerina/feature/search/widget/search_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/layout/windows_scope.dart';
import 'package:uikit/themes/app_theme.dart';

class AppMaterial extends StatefulWidget {
  const AppMaterial({super.key});

  @override
  State<AppMaterial> createState() => _AppMaterialState();
}

class _AppMaterialState extends State<AppMaterial> {
  @override
  Widget build(BuildContext context) {
    final themeController = DependScope.of(
      context,
      listen: false,
    ).dependModel.themeController;
    return BlocProvider(
      create: (context) => SearchBloc(searchRepository: ISearchRepository(dio: Dio()))..add(SearchMovie(query: 'нигер')),
      child: ListenableBuilder(
        listenable: themeController,
        builder: (context, child) {
          return LayoutScope(
            child: MaterialApp(
              theme: ThemeData(
                useMaterial3: true,
                extensions: [AppTheme.light],
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                extensions: [AppTheme.dark],
              ),
              themeMode: themeController.isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: SearchScreen(),
            ),
          );
        },
      ),
    );
  }
}
