import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ai_derma_diagnosis/routes/app_routes.dart';

import 'package:ai_derma_diagnosis/widgets/common/custom_button.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_appbar.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_scaffold.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_glass_container.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(showBackButton: false),
      body: Center(
        child: SizedBox(
          width: double.infinity, // Column 너비 100%
          child: Column(
            children: [
              SizedBox(
                width: double.infinity, // Row 너비 100%
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomGlassContainer(
                        child: SizedBox(
                          height: 80,
                          child: Center(child: Text('Hello')),
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
                            height: 80,
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
              const Gap(16),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomGlassContainer(
                        child: SizedBox(
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.signal_cellular_alt_rounded,
                                size: 25.0,
                                color: Colors.green,
                              ),
                              Text('진단 횟수'),
                              const Gap(4),
                              Text('0 회', style: TextStyle(fontSize: 15)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Gap(16),
                    Expanded(
                      child: CustomGlassContainer(
                        child: SizedBox(
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.assignment_turned_in_rounded,
                                size: 25.0,
                                color: Colors.purple[400],
                              ),
                              Text('평균 점수'),
                              const Gap(4),
                              Text('0 점', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(16),
              CustomGlassContainer(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svgs/diagnosis.svg', height: 50),
                      const Gap(20),
                      Text(
                        '첫 번째 피부 진단을 시작해보세요!',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      const Gap(15),
                      Text('AI가 분석한 정확한 피부 상태를 확인하고'),
                      Text('개인 맞춤 케어 가이드를 받아보세요'),
                      const Gap(15),
                      CustomButton(
                        text: '진단하기',
                        backgroundColor: const Color(0xFF2897FF),
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.diagnosis);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
