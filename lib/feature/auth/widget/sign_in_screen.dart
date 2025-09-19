import 'package:cinerina/feature/auth/bloc/auth_bloc.dart';
import 'package:cinerina/feature/initialization/widget/depend_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingInScreen extends StatelessWidget {
  const SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = DependScope.of(
      context,
      listen: false,
    ).dependModel.authBloc;
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: TextButton(
          child: Text('Sign In Screen'),
          onPressed: () => authBloc.add(
            AuthLoginRequested(
              email: 'gromovd139@gmai.com',
              password: 'botbot228',
            ),
          ),
        ),
      ),
    );
  }
}
