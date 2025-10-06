import 'app_routes.dart';
import 'package:flutter/material.dart';
import 'package:ai_derma_diagnosis/screens/home/home_screen.dart';
import 'package:ai_derma_diagnosis/screens/signup/signup_screen.dart';
import 'package:ai_derma_diagnosis/screens/dashboard/dashboard_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.home: (context) => const HomeScreen(),
    AppRoutes.signup: (context) => const SignupScreen(),
    AppRoutes.dashboard: (context) => const DashboardScreen(),
  };
}
