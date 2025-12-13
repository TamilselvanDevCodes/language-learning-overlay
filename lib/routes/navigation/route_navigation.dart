import 'package:flutter/material.dart';
import 'package:language_learning_overlay/routes/navigation/route_constants.dart';
import 'package:language_learning_overlay/screens/dashboard/dashboard_screen.dart';
import 'package:language_learning_overlay/screens/error/error_screen.dart';
import 'package:language_learning_overlay/screens/splash/splash_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.rSplashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case RouteConstants.rDashboardScreen:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
          settings: settings,
        );
        case RouteConstants.rOverlayScreen:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
          settings: settings,
        );
    }
  }
}
