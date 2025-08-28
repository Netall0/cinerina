import 'package:cinerina/feature/initialization/model/depend_container.dart';
import 'package:flutter/material.dart';

final class DependScope extends InheritedWidget {
  const DependScope({required super.child, required this.dependModel});

  final DependContainer dependModel;

  static DependScope of(BuildContext context, {bool listen = false}) => listen
      ? context.dependOnInheritedWidgetOfExactType<DependScope>()!
      : context.getElementForInheritedWidgetOfExactType<DependScope>()!.widget
            as DependScope;

  @override
  bool updateShouldNotify(covariant DependScope oldWidget) {
    return dependModel != oldWidget.dependModel;
  }
}
