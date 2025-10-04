import 'package:flutter/material.dart';
import 'package:ai_derma_diagnosis/widgets/custom_scaffold.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: const Center(child: Text('Signup Screen')));
  }
}
