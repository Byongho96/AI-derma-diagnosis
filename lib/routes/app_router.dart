import 'app_routes.dart';
import 'package:flutter/material.dart';
import 'package:ai_derma_diagnosis/screens/home/home_screen.dart';
import 'package:ai_derma_diagnosis/screens/signup/signup_screen.dart';
import 'package:ai_derma_diagnosis/screens/dashboard/dashboard_screen.dart';
import 'package:ai_derma_diagnosis/screens/diagnosis/diagnosis_screen.dart';
import 'package:ai_derma_diagnosis/screens/diagnosis_result/diagnosis_result_screen.dart';
import 'package:ai_derma_diagnosis/screens/diagnosis_history/diagnosis_history_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.home: (context) => const HomeScreen(),
    AppRoutes.signup: (context) => const SignupScreen(),
    AppRoutes.dashboard: (context) => const DashboardScreen(),
    AppRoutes.diagnosis: (context) => const DiagnosisScreen(),
    AppRoutes.diagnosisResult: (context) => const DiagnosisResultScreen(),
    AppRoutes.diagnosisHistory: (context) => const DiagnosisHistoryScreen(),
  };
}
