import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingUpScreen
 extends StatelessWidget {
  const SingUpScreen
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.red,
      body: Center(child: Text('register screen'),),
    );
  }
}