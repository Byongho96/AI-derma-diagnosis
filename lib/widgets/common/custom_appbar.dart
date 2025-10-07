import 'package:flutter/material.dart';
import 'package:ai_derma_diagnosis/routes/app_routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;

  const CustomAppBar({super.key, this.title, this.showBackButton = true});

  /*
  backgroundColor :  AppBar 배경색
  elevation : AppBar 그림자 깊이 (0이면 그림자 없음)
  automaticallyImplyLeading : 뒤로가기 버튼 자동 생성 여부
  leading : AppBar 왼쪽에 표시할 위젯 (보통 뒤로가기 버튼)
  actions : AppBar 오른쪽에 표시할 위젯 목록 (보통 설정 버튼 등)
  */
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 20,
              ),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/svgs/account.svg',
            height: 30,
            width: 30,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.login);
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  // PreferredSizeWidget 인터페이스 구현을 위한 preferredSize 속성
  @override
  Size get preferredSize => const Size.fromHeight(56.0); // Flutter 기본 AppBar 높이
}
