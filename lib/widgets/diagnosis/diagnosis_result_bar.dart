import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DiagnosisResultBar extends StatefulWidget {
  final String label;
  final String grade;
  final double value;
  final String description;

  const DiagnosisResultBar({
    super.key,
    required this.label,
    required this.grade,
    required this.value,
    required this.description,
  });

  @override
  State<DiagnosisResultBar> createState() => DiagnosisResultBarState();
}

class DiagnosisResultBarState extends State<DiagnosisResultBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _animation = Tween<double>(
      begin: 0,
      end: widget.value,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.label),
            Text(
              '${widget.grade}점',
              style: const TextStyle(color: Colors.orange),
            ),
          ],
        ),
        const Gap(4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            height: 10,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return LinearProgressIndicator(
                  value: _animation.value,
                  backgroundColor: Colors.white,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFF2897FF),
                  ),
                );
              },
            ),
          ),
        ),
        const Gap(4),
        Text(widget.description, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
