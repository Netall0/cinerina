import 'package:cinerina/feature/settings/data/i_settings_repository.dart';
import 'package:cinerina/feature/settings/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:uikit/layout/windows_scope.dart';
import 'package:uikit/themes/app_theme.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key, this.pref});

  final pref;

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late ThemeController themeController;

  @override
  void initState() {
    themeController = ThemeController(
      brightness: Brightness.light,
      themeRepository: IThemeRepository(widget.pref),
    );
    super.initState();

    // Слушаем изменения в контроллере
    themeController.addListener(() {
      setState(() {}); // обновляем UI при изменении темы
    });
  }

  @override
  void dispose() {
    themeController.removeListener(() {});
    themeController.dispose();
    super.dispose();
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
      body: Center(
        child: ValueListenableBuilder(
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
      ),
    );
  }
}
