import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seznam/features/posts/screens/post_detail_screen.dart';
import 'package:seznam/features/posts/screens/post_screen.dart';
import 'package:seznam/features/users/screens/user_detail_screen.dart';
import 'package:seznam/features/users/screens/user_screen.dart';
import 'package:seznam/home.dart';
import 'package:seznam/routing/route_constants.dart';
import 'package:seznam/splash.dart';

class AppRouter {
  AppRouter._();

  static String initial = "/";

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorUsers = GlobalKey<NavigatorState>();
  static final _shellNavigatorPosts = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        name: RouteConstansts.splash,
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScreen(
               navigationShell: navigationShell,
              );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _shellNavigatorUsers,
            routes: <RouteBase>[
              GoRoute(
                name: RouteConstansts.users,
                path: '/${RouteConstansts.users}',
                builder: (BuildContext context, GoRouterState state) =>
                    const UserScreen(),
                routes: [
                  GoRoute(
                    name: RouteConstansts.userDetail,
                    path: ':id',
                    pageBuilder: (context, state) => CustomTransitionPage<void>(
                      key: state.pageKey,
                      child: UserDetailScreen(
                        id: int.parse(state.pathParameters['id']!),
                      ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              FadeTransition(opacity: animation, child: child),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorPosts,
            routes: <RouteBase>[
              GoRoute(
                name: RouteConstansts.posts,
                path: '/${RouteConstansts.posts}',
                builder: (BuildContext context, GoRouterState state) =>
                    const PostScreen(),
                routes: [
                  GoRoute(
                    name: RouteConstansts.postDetail,
                    path: ':id',
                    pageBuilder: (context, state) {
                      return CustomTransitionPage<void>(
                        key: state.pageKey,
                        child: PostDetailScreen(
                              id: int.parse(state.pathParameters['id']!),
                          ),
                        transitionsBuilder: (
                          context,
                          animation,
                          secondaryAnimation,
                          child,
                        ) => FadeTransition(opacity: animation, child: child),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
