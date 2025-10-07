import 'package:flutter/material.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_appbar.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_scaffold.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
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
