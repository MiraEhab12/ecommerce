import 'package:ecommerce_udemy/core/screens/main_screen.dart';
import 'package:ecommerce_udemy/features/account_screen/presentation/pages/account_screen.dart';
import 'package:ecommerce_udemy/features/auth_screen/presentation/pages/login_screen.dart';
import 'package:ecommerce_udemy/features/auth_screen/presentation/pages/sign_up_sceen.dart';
import 'package:ecommerce_udemy/features/cartscreen/presentation/pages/cart_screen.dart';
import 'package:ecommerce_udemy/features/home_screen/presentation/pages/details_screen.dart';
import 'package:ecommerce_udemy/features/home_screen/presentation/pages/home_screen.dart';

import 'package:ecommerce_udemy/utils/app_utils/app_route_name.dart';
import 'package:flutter/material.dart';

class RouterApp {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      var args = settings.arguments;

      switch (settings.name) {
         case RouteName.loginScreen:
          return MaterialPageRoute(builder: (_) => LoginScreen());
        case RouteName.signupSceen:
          return MaterialPageRoute(builder: (_) => SignupSceen());
          case RouteName.mainScreen:
          return MaterialPageRoute(builder: (_) => MainScreen());
        case RouteName.homescreen:
          return MaterialPageRoute(builder: (_) => HomeScreen());
        case RouteName.detailsScreen:
          return MaterialPageRoute(builder: (_) => DetailsScreen(), settings: settings);
        case RouteName.cartScreen:
          return MaterialPageRoute(builder: (_) => CartScreen());
  case RouteName.accountScreen:
          return MaterialPageRoute(builder: (_) => AccountScreen());
        default:
          return MaterialPageRoute(builder: (_) => const MainScreen());
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static Future pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) async {
    return await navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  static Future pushNamed(String routeName, {Object? arguments}) async {
    return await navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future push(route, {Object? arguments}) async {
    return await navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => route),
    );
  }

  static pop<T>([T? result]) {
    return navigatorKey.currentState?.pop(result);
  }

  static bool get canPop => navigatorKey.currentState?.canPop() ?? false;

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('خطأ')),
          body: const Center(
            child: Text('نعتذر حدث خطأ , الرجاء اعادة المحاولة'),
          ),
        );
      },
    );
  }

  static _animateRouteBuilder(Widget to, {double x = 1, double y = 0}) =>
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => to,
        opaque: false,
        transitionDuration: const Duration(milliseconds: 150),
        reverseTransitionDuration: const Duration(milliseconds: 150),
        transitionsBuilder: (context, animation, animationTime, child) {
          final tween = Tween<Offset>(
            begin: Offset(x, y),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.ease));
          final tween2 = Tween<double>(begin: 0, end: 1);
          return SlideTransition(
            position: animation.drive(tween),
            child: FadeTransition(
              opacity: animation.drive(tween2),
              child: child,
            ),
          );
        },
      );
}
