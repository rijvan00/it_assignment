import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/home/view/gallery_view.dart';
import 'package:flutter_riverpod_base/src/global/views/splash.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: SplashScreen.routePath,
  routes: [
    GoRoute(
      path: SplashScreen.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: GalleryView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return GalleryView();
      },
    ),
  ],
);
