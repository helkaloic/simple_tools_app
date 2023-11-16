import 'package:go_router/go_router.dart';
import 'package:simple_tools_app/src/app/services/navigation_service.dart';
import 'package:simple_tools_app/src/features/home/presentation/page/home_page.dart';

part 'routes.dart';

class AppRouter {
  GoRouter router = GoRouter(
    navigatorKey: NavigationService().navigationKey,
    initialLocation: AppRoutes.init,
    routes: [
      GoRoute(
        path: AppRoutes.init,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
