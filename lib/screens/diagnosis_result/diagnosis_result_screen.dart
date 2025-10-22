import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ai_derma_diagnosis/routes/app_routes.dart';

import 'package:ai_derma_diagnosis/widgets/common/custom_appbar.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_scaffold.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_glass_container.dart';
import 'package:ai_derma_diagnosis/widgets/diagnosis/diagnosis_result_chart.dart';

class DiagnosisResultScreen extends StatefulWidget {
  const DiagnosisResultScreen({super.key});

  @override
  State<DiagnosisResultScreen> createState() => _DiagnosisResultScreenState();
}

class _DiagnosisResultScreenState extends State<DiagnosisResultScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: 300,
                  color: Colors.grey,
                  child: const Center(
                    child: Text(
                      '촬영된 이미지 미리보기',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              } else if (index == 1) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.diagnosis);
                            },
                            child: CustomGlassContainer(
                              child: SizedBox(
                                height: 60,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.photo_camera, size: 25.0),
                                    Text('다시 진단하기'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(16),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.diagnosisHistory,
                              );
                            },
                            child: CustomGlassContainer(
                              child: SizedBox(
                                height: 60,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.history_rounded, size: 25.0),
                                    Text('기록보기'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: CustomGlassContainer(child: DiagnosisResultChart()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

/**
 * ListView.builder에서 각 아이템이 별도의 위젯으로 렌더링 되기 때문에
 * 아이템 사이에 간격을 주기 위해서는 Padding 위젯을 사용해야 함
 * (Gap 위젯은 Column/Row 내에서만 동작)
 */
