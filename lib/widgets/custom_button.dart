import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor; // 텍스트 색상 옵션 추가

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height = 40,
    this.backgroundColor,
    this.textColor = Colors.white, // 기본값 흰색
  });

  /*
  width : 버튼의 너비, 기본 100% (double.infinity)
  height : 버튼의 높이
  text : 버튼에 표시할 텍스트
  onPressed : 버튼이 눌렸을 때 실행할 콜백 함수
  backgroundColor : 버튼 배경색
  textColor : 버튼 텍스트 색상
  */
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor, // 텍스트 색상 적용
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: textColor, // 텍스트 색상 적용
          ),
        ),
      ),
    );
  }
}
