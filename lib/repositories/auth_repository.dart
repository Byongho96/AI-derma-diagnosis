import '../services/api_service.dart';
import '../models/user.dart';

class AuthRepository {
  // 간단한 토큰 저장용 변수들 (실제로는 SharedPreferences나 Secure Storage 사용 권장)
  static String? _accessToken;
  static String? _refreshToken;

  // 토큰 저장
  static void setTokens(String accessToken, {String? refreshToken}) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    // ApiService에도 토큰 설정
    ApiService.setToken(accessToken);
  }

  // 토큰 삭제
  static void clearTokens() {
    _accessToken = null;
    _refreshToken = null;
    // ApiService의 토큰도 삭제
    ApiService.clearToken();
  }

  // 회원가입
  static Future<bool> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiService.post(
        '/api/v1/users/register',
        data: {'username': username, 'email': email, 'password': password},
      );

      return response.statusCode == 201 || response.statusCode == 200;
    } catch (e) {
      print('회원가입 실패: $e');
      return false;
    }
  }

  // 로그인
  static Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiService.post(
        '/api/v1/users/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        // 토큰 저장
        final accessToken = response.data['access_token'];
        final refreshToken = response.data['refresh_token'];

        setTokens(accessToken, refreshToken: refreshToken);

        // 사용자 정보 반환
        if (response.data['user'] != null) {
          return User.fromJson(response.data['user']);
        } else {
          // 사용자 정보가 없으면 별도로 조회
          return await _getCurrentUser();
        }
      }
    } catch (e) {
      print('로그인 실패: $e');
    }
    return null;
  }

  // 로그아웃
  static Future<bool> logout() async {
    try {
      // 서버에 로그아웃 요청 (선택사항)
      await ApiService.post('/api/v1/users/logout');
    } catch (e) {
      print('서버 로그아웃 요청 실패: $e');
    }

    // 로컬 토큰 삭제
    clearTokens();
    return true;
  }

  // 토큰 검증 및 자동 로그인
  static Future<User?> checkAuthStatus() async {
    try {
      // 저장된 토큰이 있는지 확인
      if (_accessToken == null) return null;

      // 현재 사용자 정보 조회로 토큰 유효성 확인
      return await _getCurrentUser();
    } catch (e) {
      print('인증 상태 확인 실패: $e');
      // 토큰이 무효한 경우 삭제
      clearTokens();
      return null;
    }
  }

  // 현재 사용자 정보 조회 (내부 헬퍼 메서드)
  static Future<User?> _getCurrentUser() async {
    try {
      final response = await ApiService.get('/api/v1/users/me');
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      }
    } catch (e) {
      print('사용자 정보 조회 실패: $e');
    }
    return null;
  }
}
