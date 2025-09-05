import 'package:cinerina/feature/app/widget/app_material.dart';
import 'package:cinerina/feature/initialization/model/depend_container.dart';
import 'package:cinerina/feature/initialization/widget/depend_scope.dart';
import 'package:flutter/material.dart';
import 'package:uikit/layout/windows_scope.dart';

class AppScope extends StatefulWidget {
  const AppScope({super.key, required this.dependModel});

  final DependContainer dependModel;

  @override
  State<AppScope> createState() => _AppScopeState();
}

class _AppScopeState extends State<AppScope> {
  @override
  Widget build(BuildContext context) {
    return LayoutScope(
      child: DependScope(dependModel: widget.dependModel, child: AppMaterial()),
    );
  }
}
