import 'package:flutter/material.dart';
import 'package:ai_derma_diagnosis/widgets/custom_scaffold.dart';
import 'package:ai_derma_diagnosis/widgets/glass_container.dart';
import 'package:ai_derma_diagnosis/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  // HomeScreen 위젯의 생성자
  // 부모 클래스의 key 파라미터 전달
  // key는 위젯의 고유 식별자로, 위젯 트리에서 위치를 추적하는 데 사용
  const HomeScreen({super.key});

  // StatefulWidget의 createState 메서드 재정의
  // StatefulWidget을 상속 받는 모든 위젯은 createState 메서드를 구현해야 함
  // 이 메서드는 해당 위젯의 상태를 관리하는 State 객체를 생성하여 반환
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// StatefulWidget은 구조만 정의하고 실제 데이터와 UI, 상태 관리는 State 클래스에서 수행
// createState()을 통해 위젯과 상태 객체를 연결
class _HomeScreenState extends State<HomeScreen> {
  @override
  // 위젯 화면이 어떻게 그려질지 정의
  // Flutter가 위젯을 그릴 때 자동으로 호출
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: GlassContainer(
          height: 400,
          alignment: Alignment.center,
          child: CustomButton(
            text: '로그인',
            backgroundColor: const Color(0xFF2897FF),
            textColor: Colors.white,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

// StatefulWidget 클래스는 State 객체를 만들어 주는 역할만 수행 : '이 위젯은 상태를 가질 수 있다'의 틀만 제공
// 실제 화면의 UI와 State은 State 클래스에서 모두 처리
// 이렇게 분리할 경우, 상태가 바뀔 때마다 State만 새로 그리면 되므로 성능 최적화에 유리
