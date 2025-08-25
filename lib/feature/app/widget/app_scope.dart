import 'package:cinerina/feature/app/widget/app_material.dart';
import 'package:cinerina/feature/initialization/model/depend_container.dart';
import 'package:cinerina/feature/initialization/widget/depend_scope.dart';
import 'package:flutter/material.dart';
import 'package:uikit/layout/windows_scope.dart';

class AppScope extends StatelessWidget {
  const AppScope({super.key, required this.dependModel});

  final DependContainer dependModel;

  @override
  Widget build(BuildContext context) {
    return LayoutScope(
      child: DependScope(
        dependModel: dependModel,
        child: AppMaterial(pref: dependModel.sharedPreferences),
      ),
    );
  }
}
