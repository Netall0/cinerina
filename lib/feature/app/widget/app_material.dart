import 'package:cinerina/core/config/app_config.dart';
import 'package:cinerina/feature/settings/data/i_settings_repository.dart';
import 'package:cinerina/feature/settings/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:uikit/layout/windows_scope.dart';
import 'package:uikit/themes/app_theme.dart';

class AppMaterial extends StatefulWidget {
  const AppMaterial({super.key, required this.pref});

  final pref;

  @override
  State<AppMaterial> createState() => _AppMaterialState();
}

class _AppMaterialState extends State<AppMaterial> {
  late ThemeController themeController;

  @override
  void initState() {
    themeController = ThemeController(
      brightness: Brightness.dark,
      themeRepository: IThemeRepository(widget.pref),
    );
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return LayoutScope(
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true, extensions: [AppTheme.light]),
        darkTheme: ThemeData(useMaterial3: true, extensions: [AppTheme.dark]),
        themeMode: themeController.isDark ? ThemeMode.dark : ThemeMode.light,
        home: Screen(themeController: themeController),
      ),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppConfig.apiKey,
            style: Theme.of(context).extension<AppTheme>()!.h1,
          ),

          ValueListenableBuilder(
            valueListenable: ValueNotifier(
              themeController.brightness == Brightness.dark,
            ),
            builder: (context, value, child) {
              return Switch(
                value: value,
                onChanged: (value) => themeController.toggleTheme(),
              );
            },
          ),
        ],
      ),
    );
  }
}
