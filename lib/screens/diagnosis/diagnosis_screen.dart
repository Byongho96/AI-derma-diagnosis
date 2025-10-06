import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:ai_derma_diagnosis/widgets/custom_appbar.dart';
import 'package:ai_derma_diagnosis/widgets/custom_scaffold.dart';
import 'package:ai_derma_diagnosis/widgets/custom_glass_container.dart';

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '촬영 가이드',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text('1. 밝고 깨끗한 배경에서 촬영하세요.'),
                      Text('2. 피부가 잘 보이도록 촬영하세요.'),
                      Text('3. 너무 가까이서 촬영하지 마세요.'),
                    ],
                  ),
                ),
              ),
              const Gap(16),
              Expanded(
                // Container를 Expanded로 감싸기 (남는 공간 전부 차지)
                child: Container(
                  color: Colors.grey,
                  child: const Center(
                    child: Text(
                      '촬영된 이미지 미리보기',
                      style: TextStyle(color: Colors.white),
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
                      child: CustomGlassContainer(
                        child: SizedBox(
                          height: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.photo_camera, size: 25.0),
                              Text('카메라 촬영'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Gap(16),
                    Expanded(
                      child: CustomGlassContainer(
                        child: SizedBox(
                          height: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_photo_alternate, size: 25.0),
                              Text('사진 업로드'),
                            ],
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
