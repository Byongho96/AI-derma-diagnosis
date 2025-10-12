import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ai_derma_diagnosis/routes/app_routes.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_appbar.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_scaffold.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_glass_container.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_input.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomInput(label: '닉네임', isLabelLeft: true),
                    const Gap(12),
                    CustomInput(
                      label: '이메일',
                      isLabelLeft: true,
                      enabled: false,
                    ),
                  ],
                ),
              ),
              const Gap(16),
              CustomGlassContainer(
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text('알림 설정', style: TextStyle(fontSize: 14)),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.notifications);
                        },
                      ),
                      Divider(color: Colors.white),
                      ListTile(
                        title: Text(
                          '회원가입 및 이용약관',
                          style: TextStyle(fontSize: 14),
                        ),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          // 회원가입 및 이용약관 화면으로 이동
                        },
                      ),
                      Divider(color: Colors.white),
                      ListTile(
                        title: Text('로그아웃', style: TextStyle(fontSize: 14)),
                        trailing: Icon(Icons.logout),
                        onTap: () {
                          // 로그아웃 동작
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
