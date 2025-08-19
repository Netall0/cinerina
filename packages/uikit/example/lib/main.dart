import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:uikit/layout/windows_scope.dart';
import 'package:uikit/themes/app_theme.dart';

void main(List<String> args) {
  runApp(LayoutProvider(child: UiKitExample()));
}

final themeModeSwitcher = ValueNotifier(ThemeMode.dark);

class UiKitExample extends StatelessWidget {
  const UiKitExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeModeSwitcher,
      builder: (context, value, child) {
        return MaterialApp(
          theme: ThemeData(useMaterial3: true, extensions: [AppTheme.light]),
          darkTheme: ThemeData(useMaterial3: true, extensions: [AppTheme.dark]),
          themeMode: value,
          home: UiKitExampleScreen(),
        );
      },
    );
  }
}

class UiKitExampleScreen extends StatefulWidget {
  const UiKitExampleScreen({super.key});

  @override
  State<UiKitExampleScreen> createState() => _UiKitExampleScreenState();
}

class _UiKitExampleScreenState extends State<UiKitExampleScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()!;
    final layout = LayoutScope.of(context);
    return Scaffold(
      backgroundColor: theme.background,
      body: CustomScrollView(
        slivers: [
          SliverMainAxisGroup(
            slivers: [
              SliverAppBar(
                title: const Text('Colors'),
                pinned: true,
                leading: IconButton(
                  iconSize: 24,
                  onPressed: () => themeModeSwitcher.value == ThemeMode.dark
                      ? themeModeSwitcher.value = ThemeMode.light
                      : themeModeSwitcher.value = ThemeMode.dark,
                  icon: themeModeSwitcher.value == ThemeMode.dark
                      ? const Icon(Icons.dark_mode)
                      : const Icon(Icons.light_mode),
                ),
              ),
              SliverPadding(
                padding: layout.padding,
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: layout.columns,
                    crossAxisSpacing: layout.spacing,
                    mainAxisSpacing: layout.spacing,
                    childAspectRatio: 1,
                  ),
                  itemCount: theme.colorEntries.length,
                  itemBuilder: (context, index) {
                    final color = theme.colorEntries[index];
                    return _ColorBox(color: color.value, text: color.key);
                  },
                ),
              ),
            ],
          ),
          SliverMainAxisGroup(
            slivers: [
              SliverAppBar(
                title: const Text('Colors'),
                pinned: true,
                leading: IconButton(
                  iconSize: 24,
                  onPressed: () => themeModeSwitcher.value == ThemeMode.dark
                      ? themeModeSwitcher.value = ThemeMode.light
                      : themeModeSwitcher.value = ThemeMode.dark,
                  icon: themeModeSwitcher.value == ThemeMode.dark
                      ? const Icon(Icons.dark_mode)
                      : const Icon(Icons.light_mode),
                ),
              ),
              SliverPadding(
                padding: layout.padding,
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: layout.columns,
                    crossAxisSpacing: layout.spacing,
                    mainAxisSpacing: layout.spacing,
                    childAspectRatio: 1,
                  ),
                  itemCount: theme.textStyleEntries.length,
                  itemBuilder: (context, index) {
                    final entry = theme.textStyleEntries[index];
                    return _TypographyBox(text: entry.key, style: entry.value);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ColorBox extends StatelessWidget {
  const _ColorBox({this.color, required this.text});

  final color;

  final String text;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: color,
        border: Border.all(color: Colors.black),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(text, style: TextStyle(color: getContrastColor(color))),
      ),
    );
  }
}

class _TypographyBox extends StatelessWidget {
  const _TypographyBox({required this.text, required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontFamily: style.fontFamily,
        fontSize: style.fontSize,
      ),
      textAlign: TextAlign.center,
    );
  }
}

Color getContrastColor(Color backgroundColor) {
  final luminance = backgroundColor.computeLuminance();
  return luminance > 0.5 ? Colors.black87 : Colors.white;
}
