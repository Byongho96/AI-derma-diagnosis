import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:ai_derma_diagnosis/widgets/common/custom_scaffold.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_glass_container.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_button.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_input.dart';
import 'package:ai_derma_diagnosis/routes/app_routes.dart';
import 'package:ai_derma_diagnosis/repositories/auth_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    // 컨트롤러 해제
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Email 검증
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '이메일을 입력하세요';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return '올바른 이메일 형식이 아닙니다';
    }
    return null;
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    final user = await AuthRepository.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    setState(() => _isLoading = false);

    if (user != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('${user.username}님, 환영합니다!')));
      Navigator.pushReplacementNamed(context, AppRoutes.home); // 홈 화면으로 이동
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('로그인에 실패했습니다. 이메일과 비밀번호를 확인해주세요.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: CustomGlassContainer(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(20), // 세로 방향 위젯 배치
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svgs/diagnosis.svg', height: 50),
                  Text(
                    'Skin Care AI',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF93CBFF),
                    ),
                  ),
                  const Gap(10),
                  Text('AI 기반 피부 진단으로 더 건강한 피부를 만나보세요'),
                  const Gap(20),
                  CustomInput(
                    label: '이메일',
                    controller: emailController,
                    hintText: '이메일을 입력하세요',
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                  ),
                  const Gap(20),
                  CustomInput(
                    label: '비밀번호',
                    controller: passwordController,
                    hintText: '비밀번호를 입력하세요',
                    obscureText: true,
                  ),
                  const Gap(30),
                  CustomButton(
                    text: _isLoading ? '로그인 중...' : '로그인',
                    backgroundColor: const Color(0xFF2897FF),
                    textColor: Colors.white,
                    onPressed: _isLoading ? () {} : () => _handleLogin(),
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '계정이 없으신가요? ',
                        style: TextStyle(color: Color(0xFF4A4A4A)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.signup);
                        },
                        child: const Text(
                          '회원가입',
                          style: TextStyle(
                            color: Color(0xFF2897FF),
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// StatefulWidget 클래스는 State 객체를 만들어 주는 역할만 수행 : '이 위젯은 상태를 가질 수 있다'의 틀만 제공
// 실제 화면의 UI와 State은 State 클래스에서 모두 처리
// 이렇게 분리할 경우, 상태가 바뀔 때마다 State만 새로 그리면 되므로 성능 최적화에 유리
