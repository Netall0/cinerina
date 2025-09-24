import 'dart:async';

import 'package:cinerina/feature/auth/widget/sing_up_screen.dart';
import 'package:cinerina/feature/favorites/favorites_screen.dart';
import 'package:cinerina/core/router/profile_screen.dart';
import 'package:cinerina/feature/app/widget/app_shell.dart';
import 'package:cinerina/feature/auth/bloc/auth_bloc.dart';
import 'package:cinerina/feature/auth/widget/sign_in_screen.dart';
import 'package:cinerina/feature/search/model/search_model.dart';
import 'package:cinerina/feature/search/widget/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

class AppRouter {
  static GoRouter router(AuthBloc authBloc) => GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/signin',
    routes: $appRoutes,
    redirect: (context, state) {
      final authState = authBloc.state;
      final currentLocation = state.matchedLocation;

      final authPaths = ['/signin', '/signin/signup'];


      switch (state) {
        case _ when authState is  AuthLoading:
          return null;

        case  _ when authState is  AuthUnauthenticated:
          if (!authPaths.contains(currentLocation)) {
            return '/signin';
          }
          break;

        case _ when authState  is  AuthAuthenticated:
          if (currentLocation == '/signin/signup') {
            return '/signin';
          }
          if (currentLocation == '/signin') {
            return '/home';
          }
          break;
      }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

@TypedGoRoute<SignInRoute>(
  path: '/signin',
  routes: [TypedGoRoute<SignUpRoute>(path: '/signup')],
)
class SignInRoute extends GoRouteData with $SignInRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SingInScreen();
}

class SignUpRoute extends GoRouteData with $SignUpRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SingUpScreen();
}

@TypedStatefulShellRoute<AppShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<SearchShellBranchData>(
      routes: [
        TypedGoRoute<SearchRouteData>(
          path: '/home',
          routes: [
            TypedGoRoute<SearchDetailedRouteData>(path: '/detailed/:name'),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<FavoritesShellBranchData>(
      routes: [TypedGoRoute<FavoritesRouteData>(path: '/favorites')],
    ),
    TypedStatefulShellBranch<ProfileShellBranchData>(
      routes: [TypedGoRoute<ProfileRouteData>(path: '/profile')],
    ),
  ],
)
class AppShellRouteData extends StatefulShellRouteData {
  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return AppShell(statefulNavigationShell: navigationShell);
  }
}

class SearchShellBranchData extends StatefulShellBranchData {
  const SearchShellBranchData();
}

class ProfileShellBranchData extends StatefulShellBranchData {
  const ProfileShellBranchData();
}

class FavoritesShellBranchData extends StatefulShellBranchData {
  const FavoritesShellBranchData();
}

class SearchRouteData extends GoRouteData with $SearchRouteData {
  const SearchRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchScreen();
  }
}

class SearchDetailedRouteData extends GoRouteData
    with $SearchDetailedRouteData {
  final String name;
  final String? heroTag;
  final String? imageUrl;
  final String? description;

  const SearchDetailedRouteData({
    required this.name,
    this.heroTag,
    this.imageUrl,
    this.description,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchDetailedScreen(
      heroTag: heroTag ?? 'default',
      name: name,
      imageUrl: imageUrl ?? '',
      description: description ?? '',
      movie: state.extra as Doc?,
    );
  }
}

class FavoritesRouteData extends GoRouteData with $FavoritesRouteData {
  const FavoritesRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FavoritesScreen();
  }
}

class ProfileRouteData extends GoRouteData with $ProfileRouteData {
  const ProfileRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfileScreen();
  }
}
