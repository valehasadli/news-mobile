import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/landing/presentation/landing_screen.dart';
import './scaffold_with_nested_navigation.dart';

enum AppRoute {
  landing,
  login,
  registration,
  logout,
  profile,
  search,
  preference,
  feed
}

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _landingNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _landingNavigatorKey,
            routes: [
              GoRoute(
                path: '/',
                name: AppRoute.landing.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const LandingScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
