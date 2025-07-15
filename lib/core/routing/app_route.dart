import 'package:flutter/material.dart';
import 'package:products_app/core/routing/routes.dart';
import 'package:products_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:products_app/features/onBoard/presentation/screens/onboard_screen.dart';
import 'package:products_app/features/home/presentation/screens/home_screen.dart';
import 'package:products_app/features/details/presentation/screens/details_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.onboardScreen:
        return MaterialPageRoute(builder: (_) => OnboardScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.detailsScreen:
        return MaterialPageRoute(builder: (_) => DetailsScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text("No route defined for ${settings.name}"),
                ),
              ),
        );
    }
  }
}
