import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ai_derma_diagnosis/routes/app_routes.dart';

import 'package:ai_derma_diagnosis/widgets/custom_appbar.dart';
import 'package:ai_derma_diagnosis/widgets/custom_scaffold.dart';
import 'package:ai_derma_diagnosis/widgets/custom_glass_container.dart';

class DiagnosisHistoryScreen extends StatefulWidget {
  const DiagnosisHistoryScreen({super.key});

  @override
  State<DiagnosisHistoryScreen> createState() => _DiagnosisHistoryScreenState();
}

class _DiagnosisHistoryScreenState extends State<DiagnosisHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: SizedBox(
          width: double.infinity, // Column 너비 100%
          child: Column(),
        ),
      ),
    );
  }
}
