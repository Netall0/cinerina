import 'package:cinerina/feature/app/data/i_theme_repository.dart';
import 'package:cinerina/feature/app/data/theme_repository.dart';
import 'package:cinerina/feature/app/logic/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uikit/layout/windows_scope.dart';
import 'package:uikit/themes/app_theme.dart';

final themeModeSwitcher = ValueNotifier(ThemeMode.dark);

class AppRoot extends StatelessWidget {
  const AppRoot({super.key, 
     this.pref,});

    final pref;


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeModeSwitcher,
      builder: (context, value, child) {
        return LayoutProvider(
          child: MaterialApp(
            theme: ThemeData(useMaterial3: true, extensions: [AppTheme.light]),
            darkTheme: ThemeData(
              useMaterial3: true,
              extensions: [AppTheme.dark],
            ),
            themeMode: value,
            home: Screen(themeController: ThemeController(brightness: Brightness.dark, themeRepository: IThemeRepository(pref)),),
          ),
        );
      },
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({super.key, required this.themeController});

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).extension<AppTheme>()!.background,
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: ValueNotifier(themeController.brightness == Brightness.dark),
          builder: (context, value, child) {
            return Switch(value: value, onChanged: (value) => themeController.toggleTheme());
          },
        ),
      ),
    );
  }
}
