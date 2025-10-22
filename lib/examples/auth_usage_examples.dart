import '../repositories/auth_repository.dart';
import '../models/user.dart';

// 간단한 사용 예시들

class AuthService {
  // 1. 회원가입 예시
  static Future<bool> signupUser() async {
    return await AuthRepository.signup(
      username: 'testuser',
      email: 'test@example.com',
      password: 'password123',
    );
  }

  // 2. 로그인 예시
  static Future<User?> loginUser() async {
    return await AuthRepository.login(
      email: 'test@example.com',
      password: 'password123',
    );
  }

  // 3. 로그아웃 예시
  static Future<void> logoutUser() async {
    await AuthRepository.logout();
  }

  // 4. 자동 로그인 체크 예시
  static Future<User?> autoLogin() async {
    return await AuthRepository.checkAuthStatus();
  }

  // 5. 비밀번호 변경 예시
  static Future<bool> changeUserPassword() async {
    return await AuthRepository.changePassword(
      currentPassword: 'oldpassword',
      newPassword: 'newpassword123',
    );
  }

  // 6. 비밀번호 재설정 요청 예시
  static Future<bool> resetPassword() async {
    return await AuthRepository.requestPasswordReset('test@example.com');
  }
}

// 실제 사용 예시 함수들
void authUsageExamples() async {
  // 회원가입
  print('=== 회원가입 ===');
  bool signupSuccess = await AuthRepository.signup(
    username: 'newuser',
    email: 'newuser@example.com',
    password: 'securepassword123',
  );
  print('회원가입 결과: $signupSuccess');

  // 로그인
  print('\n=== 로그인 ===');
  User? user = await AuthRepository.login(
    email: 'newuser@example.com',
    password: 'securepassword123',
  );
  if (user != null) {
    print('로그인 성공: ${user.username} (${user.email})');
  } else {
    print('로그인 실패');
  }

  // 자동 로그인 체크
  print('\n=== 자동 로그인 체크 ===');
  User? autoLoginUser = await AuthRepository.checkAuthStatus();
  if (autoLoginUser != null) {
    print('자동 로그인 성공: ${autoLoginUser.username}');
  } else {
    print('자동 로그인 실패 - 로그인 필요');
  }

  // 비밀번호 변경
  print('\n=== 비밀번호 변경 ===');
  bool changeSuccess = await AuthRepository.changePassword(
    currentPassword: 'securepassword123',
    newPassword: 'newsecurepassword456',
  );
  print('비밀번호 변경 결과: $changeSuccess');

  // 비밀번호 재설정 요청
  print('\n=== 비밀번호 재설정 요청 ===');
  bool resetSuccess = await AuthRepository.requestPasswordReset(
    'newuser@example.com',
  );
  print('비밀번호 재설정 요청 결과: $resetSuccess');

  // 로그아웃
  print('\n=== 로그아웃 ===');
  bool logoutSuccess = await AuthRepository.logout();
  print('로그아웃 결과: $logoutSuccess');
}
