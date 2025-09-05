import 'package:cinerina/feature/initialization/widget/depend_scope.dart';
import 'package:cinerina/feature/search/bloc/search_bloc.dart';
import 'package:cinerina/feature/search/widget/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:uikit/themes/app_theme.dart';

class AppMaterial extends StatefulWidget {
  const AppMaterial({super.key});

  @override
  State<AppMaterial> createState() => _AppMaterialState();
}

class _AppMaterialState extends State<AppMaterial> {
  @override
  void didChangeDependencies() {
    DependScope.of(context,).dependModel.searchBloc.add(SearchMovie(query: ''));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    DependScope.of(context).dependModel.searchBloc.close();
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
        return MaterialApp(
          theme: ThemeData(useMaterial3: true, extensions: [AppTheme.light]),
          darkTheme: ThemeData(useMaterial3: true, extensions: [AppTheme.dark]),
          themeMode: themeController.isDark ? ThemeMode.dark : ThemeMode.light,
          home: SearchScreen(),
        );
      },
    );
  }
}
