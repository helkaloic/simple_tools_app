import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:simple_tools_app/src/app/services/navigation_service.dart';
import 'package:simple_tools_app/src/features/home/presentation/pages/home_page.dart';
import 'package:simple_tools_app/src/features/object_detection/presentation/pages/fullscreen_image_page.dart';
import 'package:simple_tools_app/src/features/object_detection/presentation/pages/object_detection_page.dart';

part 'routes.dart';

class AppRouter {
  GoRouter router = GoRouter(
    navigatorKey: NavigationService().navigationKey,
    initialLocation: AppRoutes.init,
    routes: [
      //? Route: '/'
      GoRoute(
        path: AppRoutes.init,
        builder: (context, state) => const HomePage(),
        routes: [
          //? Route: '/objectDetection'
          GoRoute(
            path: AppRoutes.pathName(AppRoutes.objectDetection),
            builder: (context, state) => const ObjectDetectionPage(),
            routes: [
              //? Route: '/objectDetection/image'
              GoRoute(
                path: AppRoutes.pathName(AppRoutes.objectDetectionImage),
                builder: (context, state) => FullScreenImagePage(
                  file: state.extra as File,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
