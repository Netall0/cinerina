import 'package:cinerina/feature/initialization/widget/depend_scope.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = DependScope.of(context).dependModel.authBloc;
    return Scaffold(
      body: AppBar(title: Text(bloc.state.user!.email.toString())),
    );
  }
}
