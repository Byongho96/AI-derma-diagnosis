import 'dart:ui';
import 'package:flutter/material.dart';

class CustomGlassContainer extends StatelessWidget {
  final Widget? child;
  final AlignmentGeometry? alignment;

  const CustomGlassContainer({super.key, this.child, this.alignment});

  @override
  Widget build(BuildContext context) {
    // 내부 컨텐츠 높이에 맞추기 위해 IntrinsicHeight 사용
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(0, 0, 0, 0.1),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              padding: const EdgeInsets.all(30),
              alignment: alignment,
              decoration: BoxDecoration(
                color: const Color.fromARGB(92, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color.fromARGB(194, 255, 255, 255),
                  width: 1.5,
                ),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
