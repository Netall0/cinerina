import 'package:cinerina/feature/auth/bloc/auth_bloc.dart';
import 'package:cinerina/feature/initialization/widget/depend_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = DependScope.of(context).dependModel.authBloc;
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocListener<AuthBloc, AuthState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              BlocBuilder<AuthBloc, AuthState>(
                bloc: bloc,
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state is AuthLoading
                        ? CircularProgressIndicator.adaptive
                        : () {
                            bloc.add(
                              AuthLoginRequested(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                          },
                    child: state is AuthLoading
                        ? const CircularProgressIndicator()
                        : const Text('Login'),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  context.push('/signin/signup');
                },
                child: Text('register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
