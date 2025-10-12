import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhotoUpload extends StatelessWidget {
  const PhotoUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(182, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svgs/diagnosis.svg', height: 50),
          const Gap(10),
          Text('피부 사진을 촬영하거나 업로드하세요', style: TextStyle(fontSize: 16)),
          const Gap(10),
          Text('얼굴 전체가 보이도록 촬영해주세요'),
        ],
      ),
    );
  }
}
