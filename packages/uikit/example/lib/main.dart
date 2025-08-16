import 'package:flutter/material.dart';
import 'package:uikit/themes/app_theme.dart';

void main(List<String> args) {
  runApp(UiKitExample());
}

class UiKitExample extends StatelessWidget {
  const UiKitExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        extensions:  [AppTheme.light]
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        extensions:  [AppTheme.dark]

      ),
      themeMode: ThemeMode.dark,
      home: UiKitExampleScreen(),
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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _SliverAnimatedSwitcher(child: child, duration: duration),

        ],
        
      )
    );
  }
}

class _ColorBox extends StatelessWidget {
  const _ColorBox({super.key, this.color});

  final color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ColoredBox(
        color: color
        
      ),
    );
  }
}
class _SliverAnimatedSwitcher extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const _SliverAnimatedSwitcher({
    Key? key,
    required this.child,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AnimatedSwitcher(
        duration: duration,
        child: child,
      ),
    );
  }
}