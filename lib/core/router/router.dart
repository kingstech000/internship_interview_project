import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_project/core/router/routing_constants.dart';
import 'package:interview_project/views/wallet_view.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: [
      getRoute(path: NavigatorRoutes.walletView, child: const WalletView()),
    ],
  );
}

GoRoute getRoute({
  required String path,
  required Widget child,
}) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );
    },
  );
}
