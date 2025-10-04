import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment; // 내부 정렬 옵션

  const GlassContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.padding,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: width,
          height: height,
          padding: padding ?? const EdgeInsets.all(16),
          alignment: alignment,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.15), // 불투명도 0.15
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color.fromRGBO(255, 255, 255, 0.2), // 불투명도 0.2
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
