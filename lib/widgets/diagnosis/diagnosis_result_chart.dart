import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import './diagnosis_result_bar.dart';

class DiagnosisResultChart extends StatelessWidget {
  static const List<String> kCategories = ['주름', '모공', '피지', '건선', '홍반'];

  final List<double> scores; // 피부 상태 점수 (0-100)
  final DateTime? date;

  const DiagnosisResultChart({
    super.key,
    this.scores = const [85, 65, 75, 90, 44], // 예시 데이터
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('최근 진단 결과'),
              if (date != null)
                Text(
                  '${date!.year}.${date!.month.toString().padLeft(2, '0')}.${date!.day.toString().padLeft(2, '0')}',
                  style: const TextStyle(color: Colors.grey),
                ),
            ],
          ),
          const Gap(8),
          Center(
            child: Text(
              '${scores.reduce((a, b) => a + b) / scores.length ~/ 1}점',
              style: const TextStyle(fontSize: 20, color: Colors.orange),
            ),
          ),
          const Gap(16),
          ...List.generate(
            scores.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                bottom: index != scores.length - 1 ? 16.0 : 0,
              ),
              child: DiagnosisResultBar(
                label: kCategories[index],
                grade: scores[index].toString(),
                value: scores[index] / 100,
                description: '설명입니다',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
