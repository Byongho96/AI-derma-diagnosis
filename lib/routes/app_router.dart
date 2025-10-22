import 'app_routes.dart';
import 'package:flutter/material.dart';
// import 'package:ai_derma_diagnosis/screens/splash/splash_screen.dart';
import 'package:ai_derma_diagnosis/screens/login/login_screen.dart';
import 'package:ai_derma_diagnosis/screens/signup/signup_screen.dart';
import 'package:ai_derma_diagnosis/screens/home/home_screen.dart';
import 'package:ai_derma_diagnosis/screens/diagnosis/diagnosis_screen.dart';
import 'package:ai_derma_diagnosis/screens/diagnosis_result/diagnosis_result_screen.dart';
import 'package:ai_derma_diagnosis/screens/diagnosis_history/diagnosis_history_screen.dart';
import 'package:ai_derma_diagnosis/screens/settings/settings_screen.dart';
import 'package:ai_derma_diagnosis/screens/notifications/notifications_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> get routes => {
    // AppRoutes.splash: (context) => const SplashScreen(),
    AppRoutes.home: (context) => const HomeScreen(),
    AppRoutes.login: (context) => const LoginScreen(),
    AppRoutes.signup: (context) => const SignupScreen(),
    AppRoutes.diagnosis: (context) => const DiagnosisScreen(),
    AppRoutes.diagnosisResult: (context) => const DiagnosisResultScreen(),
    AppRoutes.diagnosisHistory: (context) => const DiagnosisHistoryScreen(),
    AppRoutes.accountSettings: (context) => const SettingsScreen(),
    AppRoutes.notifications: (context) => const NotificationsScreen(),
  };
}
