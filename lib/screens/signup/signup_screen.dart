import 'package:flutter/material.dart';
import 'package:ai_derma_diagnosis/widgets/custom_scaffold.dart';
import 'package:ai_derma_diagnosis/widgets/custom_glass_container.dart';
import 'package:ai_derma_diagnosis/widgets/custom_button.dart';
import 'package:ai_derma_diagnosis/widgets/custom_input.dart';
import 'package:gap/gap.dart';
import 'package:ai_derma_diagnosis/routes/app_routes.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // 컨트롤러 선언
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // 컨트롤러 해제
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: CustomGlassContainer(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Skin Care AI',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF93CBFF),
                  ),
                ),
                const Gap(20),
                CustomInput(
                  label: '이름',
                  controller: nameController,
                  hintText: '이름을 입력하세요',
                  keyboardType: TextInputType.name,
                ),
                const Gap(20),
                CustomInput(
                  label: '이메일',
                  controller: emailController,
                  hintText: '이메일을 입력하세요',
                  keyboardType: TextInputType.emailAddress,
                ),
                const Gap(20),
                CustomInput(
                  label: '비밀번호',
                  controller: passwordController,
                  hintText: '비밀번호를 입력하세요',
                  obscureText: true,
                ),
                const Gap(20),
                CustomInput(
                  label: '비밀번호 확인',
                  controller: confirmPasswordController,
                  hintText: '비밀번호를 다시 입력하세요',
                  obscureText: true,
                ),
                const Gap(30),
                CustomButton(
                  text: '가입하기',
                  backgroundColor: const Color(0xFF2897FF),
                  textColor: Colors.white,
                  onPressed: () {
                    final name = nameController.text;
                    final email = emailController.text;
                    final password = passwordController.text;
                    final confirmPassword = confirmPasswordController.text;
                    print(
                      'Name: $name, Email: $email, Password: $password, Confirm Password: $confirmPassword',
                    );
                  },
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '이미 계정이 있으신가요? ',
                      style: TextStyle(color: Color(0xFF4A4A4A)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.home);
                      },
                      child: const Text(
                        '로그인',
                        style: TextStyle(color: Color(0xFF2897FF), height: 1.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
