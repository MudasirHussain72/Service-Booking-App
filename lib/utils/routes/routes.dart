import 'package:flutter/material.dart';
import 'package:fyp/utils/routes/route_name.dart';
import 'package:fyp/view/barber_dashboard/add_service/add_service.dart';
import 'package:fyp/view/barber_dashboard/dashboard_screen.dart';
import 'package:fyp/view/choose_role/choose_role_screen.dart';
import 'package:fyp/view/customer_dashboard/dashboard_screen.dart';
import 'package:fyp/view/forgot_password/forgot_password.dart';
import 'package:fyp/view/login/login_screen.dart';
import 'package:fyp/view/signup/create_shop_screen.dart';
import 'package:fyp/view/splash/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.loginView:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteName.forgotPasswordView:
        return MaterialPageRoute(builder: (_) => const ForgotPasseordScreen());
      case RouteName.chooseRoleView:
        return MaterialPageRoute(builder: (_) => const FirstScreen());
      case RouteName.createShopView:
        return MaterialPageRoute(builder: (_) => const CreateShopScreen());
      case RouteName.barberdashboardView:
        return MaterialPageRoute(builder: (_) => const BarberDashboardScreen());
      case RouteName.addservicesView:
        return MaterialPageRoute(builder: (_) => const AddServicesScreen());
      case RouteName.customerdashboardView:
        return MaterialPageRoute(
            builder: (_) => const CustomerDashboardScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
