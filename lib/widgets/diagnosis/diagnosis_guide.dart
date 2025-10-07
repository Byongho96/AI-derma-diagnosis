import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DiagnosisGuide extends StatelessWidget {
  const DiagnosisGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.lightbulb, size: 15, color: Colors.yellow[700]),
            Gap(5),
            Text('밝고 깨끗한 배경에서 촬영해주세요.'),
          ],
        ),
        Row(
          children: [
            Icon(Icons.lightbulb, size: 15, color: Colors.yellow[700]),
            Gap(5),
            Text('피부가 잘 보이도록 촬영해주세요.'),
          ],
        ),
        Row(
          children: [
            Icon(Icons.lightbulb, size: 15, color: Colors.yellow[700]),
            Gap(5),
            Text('적당한 거리에서 촬영해주세요.'),
          ],
        ),
      ],
    );
  }
}
