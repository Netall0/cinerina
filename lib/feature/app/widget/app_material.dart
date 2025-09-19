import 'package:cinerina/core/router/router.dart';
import 'package:cinerina/feature/favorites/bloc/favorites_bloc.dart';
import 'package:cinerina/feature/history/bloc/history_bloc.dart';
import 'package:cinerina/feature/initialization/widget/depend_scope.dart';
import 'package:cinerina/feature/search/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uikit/themes/app_theme.dart';

class AppMaterial extends StatefulWidget {
  const AppMaterial({super.key});

  @override
  State<AppMaterial> createState() => _AppMaterialState();
}

class _AppMaterialState extends State<AppMaterial> {
  @override
  void didChangeDependencies() {
    DependScope.of(
      context,
      listen: false,
    ).dependModel.searchBloc.add(SearchMovie(query: ''));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    DependScope.of(context).dependModel.searchBloc.close();
    DependScope.of(context).dependModel.historyBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = DependScope.of(
      context,
      listen: false,
    ).dependModel.themeController;

    return ListenableBuilder(
      listenable: themeController,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router(
            DependScope.of(context).dependModel.authBloc,
          ),
          theme: ThemeData(useMaterial3: true, extensions: [AppTheme.light]),
          darkTheme: ThemeData(useMaterial3: true, extensions: [AppTheme.dark]),
          themeMode: themeController.isDark ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}
