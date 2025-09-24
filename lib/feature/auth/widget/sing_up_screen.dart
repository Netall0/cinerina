import 'package:cinerina/feature/auth/bloc/auth_bloc.dart';
import 'package:cinerina/feature/initialization/widget/depend_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordControllerConfirmed = TextEditingController();
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordControllerConfirmed.dispose(); // исправил дубль
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = DependScope.of(context).dependModel.authBloc;
    return Scaffold(
      appBar: AppBar(),
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите email';
                    }
                    if (!value.contains('@')) {
                      return 'Некорректный email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите пароль';
                    }
                    if (value.length < 6) {
                      return 'Минимум 6 символов';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordControllerConfirmed,
                  obscureText: _obscureText,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Подтвердите пароль';
                    }
                    if (value != _passwordController.text) {
                      return 'Пароли не совпадают';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'confirm password',
                    suffixIcon: IconButton(
                      onPressed: _toggle,
                      icon: _obscureText
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<AuthBloc, AuthState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state is AuthLoading
                          ? CircularProgressIndicator.adaptive
                          : () {
                              if (_formKey.currentState!.validate()) {
                                bloc.add(
                                  AuthSignUpRequested(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                              }
                            },
                      child: state is AuthLoading
                          ? const CircularProgressIndicator()
                          : const Text('register'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
