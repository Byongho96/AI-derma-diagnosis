import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ai_derma_diagnosis/routes/app_routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ai_derma_diagnosis/widgets/common/custom_appbar.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_scaffold.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_glass_container.dart';

class DiagnosisScreen extends StatefulWidget {
  const DiagnosisScreen({super.key});

  @override
  State<DiagnosisScreen> createState() => _DiagnosisScreenState();
}

class _DiagnosisScreenState extends State<DiagnosisScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: SizedBox(
          width: double.infinity, // Column 너비 100%
          child: Column(
            children: [
              CustomGlassContainer(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.lightbulb,
                            size: 15,
                            color: Colors.yellow[700],
                          ),
                          Gap(5),
                          Text('밝고 깨끗한 배경에서 촬영해주세요.'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.lightbulb,
                            size: 15,
                            color: Colors.yellow[700],
                          ),
                          Gap(5),
                          Text('피부가 잘 보이도록 촬영해주세요.'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.lightbulb,
                            size: 15,
                            color: Colors.yellow[700],
                          ),
                          Gap(5),
                          Text('적당한 거리에서 촬영해주세요.'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(16),
              Expanded(
                // Container를 Expanded로 감싸기 (남는 공간 전부 차지)
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: double.infinity,
                    color: const Color.fromARGB(182, 255, 255, 255),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/diagnosis.svg',
                          height: 50,
                        ),
                        const Gap(10),
                        Text(
                          '피부 사진을 촬영하거나 업로드하세요',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        const Gap(10),
                        Text('얼굴 전체가 보이도록 촬영해주세요'),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(16),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // 카메라 촬영 기능 실행
                          print('카메라 촬영 버튼 클릭');
                          Navigator.pushNamed(
                            context,
                            AppRoutes.diagnosisResult,
                          );
                          // TODO: 카메라 실행 로직 구현
                        },
                        child: CustomGlassContainer(
                          child: SizedBox(
                            height: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.photo_camera, size: 25.0),
                                Text('카메라 촬영'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(16),
                    Expanded(
                      child: CustomGlassContainer(
                        child: GestureDetector(
                          onTap: () {
                            // 갤러리에서 사진 선택 기능 실행
                            print('사진 업로드 버튼 클릭');
                            // TODO: 갤러리 실행 로직 구현
                          },
                          child: SizedBox(
                            height: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.add_photo_alternate, size: 25.0),
                                Text('사진 업로드'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
