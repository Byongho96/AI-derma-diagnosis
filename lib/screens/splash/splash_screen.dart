import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../repositories/auth_repository.dart';
import '../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    // 최소 2초간 스플래시 화면 표시
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    try {
      // 자동 로그인 체크
      final user = await AuthRepository.checkAuthStatus();

      if (user != null) {
        // 로그인된 상태 - 홈 화면으로 이동
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      } else {
        // 로그인 필요 - 로그인 화면으로 이동
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    } catch (e) {
      print('자동 로그인 확인 실패: $e');
      // 오류 발생 시 로그인 화면으로 이동
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 로고
            SvgPicture.asset(
              'assets/svgs/diagnosis.svg',
              height: 100,
              colorFilter: const ColorFilter.mode(
                Color(0xFF93CBFF),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 20),

            // 앱 이름
            const Text(
              'Skin Care AI',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF93CBFF),
              ),
            ),
            const SizedBox(height: 10),

            // 부제목
            const Text(
              'AI 기반 피부 진단으로 더 건강한 피부를 만나보세요',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xFFCCCCCC)),
            ),
            const SizedBox(height: 50),

            // 로딩 인디케이터
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF93CBFF)),
            ),
          ],
        ),
      ),
    );
  }
}
