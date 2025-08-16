import 'package:flutter/material.dart';
import 'package:uikit/layout/app_size.dart';

class LayotScope extends InheritedWidget{
  final int columns;
  final EdgeInsets padding;
  const LayotScope(this.padding, {Key? key, required this.columns,  required Widget child}) : super(key: key, child: child);


  static LayotScope of(BuildContext context, {bool listen = true}) {
  return listen ? context.dependOnInheritedWidgetOfExactType<LayotScope>()! : context.getElementForInheritedWidgetOfExactType<LayotScope>()!.widget as LayotScope;
  
  }
  @override
  bool updateShouldNotify(LayotScope oldWidget) => false;
  
}

class LayoutProvider extends StatelessWidget {
  final Widget child;
  const LayoutProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder:(context, constraints) {
      final width = constraints.maxWidth;
      final int columns;
      final EdgeInsets sizes;
      if (width > 1024) {
        columns = 2;
        sizes = EdgeInsets.all(AppSizes.double20);
      } else if (width > 768) {
        columns = 3;
        sizes = EdgeInsets.all(AppSizes.double16);
      } else {
        columns = 4;
        sizes = EdgeInsets.all(AppSizes.double12);
      }
      return LayotScope(sizes, columns: columns, child: child);
    },);
  }
}