import 'package:flutter/material.dart';

class CustomBackgroundContainer extends StatelessWidget {
  final Widget child;

  const CustomBackgroundContainer({super.key, required this.child});

  /*
  decoration :  Container의 배경을 꾸미는 속성
  padding : Container 내부 여백 설정
  child : Container 내부에 표시할 위젯
  */
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(15),
      child: child,
    );
  }
}
