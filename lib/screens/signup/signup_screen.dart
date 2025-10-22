import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_scaffold.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_glass_container.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_button.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_input.dart';
import 'package:gap/gap.dart';
import 'package:ai_derma_diagnosis/routes/app_routes.dart';
import 'package:ai_derma_diagnosis/repositories/auth_repository.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    // 컨트롤러 해제
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // Username 검증
  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return '사용자명을 입력하세요';
    }
    if (value.length < 3 || value.length > 50) {
      return '사용자명은 3~50자여야 합니다';
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return '영문, 숫자, _ 만 사용 가능합니다';
    }
    return null;
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

  // Password 검증
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력하세요';
    }
    if (value.length < 8 || value.length > 50) {
      return '비밀번호는 8~50자여야 합니다';
    }
    if (!RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$',
    ).hasMatch(value)) {
      return '영문과 숫자를 포함해야 합니다';
    }
    return null;
  }

  // Password 확인 검증
  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호 확인을 입력하세요';
    }
    if (value != passwordController.text) {
      return '비밀번호가 일치하지 않습니다';
    }
    return null;
  }

  Future<void> _handleSignup() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    final success = await AuthRepository.signup(
      username: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    setState(() => _isLoading = false);

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('회원가입이 완료되었습니다!')));
      Navigator.pop(context); // 로그인 화면으로 이동
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('회원가입에 실패했습니다.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: CustomGlassContainer(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(20),
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
                  const Gap(20),
                  CustomInput(
                    label: '사용자명',
                    controller: nameController,
                    hintText: '영문, 숫자, _ 사용 (3~50자)',
                    keyboardType: TextInputType.name,
                    validator: _validateUsername,
                  ),
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
                    hintText: '영문+숫자 포함 8~50자',
                    obscureText: true,
                    validator: _validatePassword,
                  ),
                  const Gap(20),
                  CustomInput(
                    label: '비밀번호 확인',
                    controller: confirmPasswordController,
                    hintText: '비밀번호를 다시 입력하세요',
                    obscureText: true,
                    validator: _validateConfirmPassword,
                  ),
                  const Gap(30),
                  CustomButton(
                    text: _isLoading ? '처리 중...' : '가입하기',
                    backgroundColor: const Color(0xFF2897FF),
                    textColor: Colors.white,
                    onPressed: _isLoading ? () {} : () => _handleSignup(),
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
                          Navigator.pushNamed(context, AppRoutes.login);
                        },
                        child: const Text(
                          '로그인',
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
