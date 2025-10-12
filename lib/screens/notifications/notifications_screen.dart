import 'package:flutter/material.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_appbar.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_scaffold.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_glass_container.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class Alarm {
  TimeOfDay time;
  String label;
  bool enabled;
  Alarm({required this.time, required this.label, this.enabled = true});
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Alarm> alarms = [
    Alarm(time: TimeOfDay(hour: 7, minute: 30), label: '기상'),
    Alarm(time: TimeOfDay(hour: 8, minute: 0), label: '아침 약', enabled: false),
  ];

  void _addAlarm() async {
    TimeOfDay selectedTime = TimeOfDay.now();
    String label = '';
    bool enabled = true;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('알람 추가', style: TextStyle(fontSize: 14)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('시간', style: TextStyle(fontSize: 14)),
                trailing: Text(
                  selectedTime.format(context),
                  style: const TextStyle(fontSize: 24),
                ),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                  );
                  if (picked != null) {
                    setState(() {
                      selectedTime = picked;
                    });
                  }
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: '라벨(선택)',
                  isDense: true,
                ),
                style: const TextStyle(fontSize: 14),
                onChanged: (v) => label = v,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('취소', style: TextStyle(fontSize: 14)),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  alarms.add(
                    Alarm(time: selectedTime, label: label, enabled: enabled),
                  );
                });
                Navigator.pop(context);
              },
              child: const Text('추가', style: TextStyle(fontSize: 14)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 24),
            onPressed: _addAlarm,
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: alarms.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final alarm = alarms[index];
            return ListTile(
              title: Text(
                alarm.time.format(context),
                style: const TextStyle(fontSize: 32),
              ),
              subtitle: Text(alarm.label, style: const TextStyle(fontSize: 14)),
              trailing: Switch(
                value: alarm.enabled,
                onChanged: (val) {
                  setState(() => alarms[index].enabled = val);
                },
                activeColor: const Color(0xFF2897FF),
              ),
              onTap: () {
                // 알람 수정 화면으로 이동 (추후 구현)
              },
            );
          },
        ),
      ),
    );
  }
}
