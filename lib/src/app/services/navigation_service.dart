import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigationKey;

  static final NavigationService _instance = NavigationService._init();
  factory NavigationService() => _instance;

  NavigationService._init() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  pushNamed(String name) => navigationKey.currentContext!.pushNamed(name);

  showMessage(String text) {
    ScaffoldMessenger.of(navigationKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black.withOpacity(0.75),
        content: Text(
          text,
        ),
      ),
    );
  }

  showDefaultLoader() {
    Future.delayed(
      Duration.zero,
      () => showDialog(
        context: navigationKey.currentContext!,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
