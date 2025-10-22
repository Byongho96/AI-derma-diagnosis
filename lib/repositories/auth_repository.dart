import '../services/api_service.dart';
import '../models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  // Secure Storage 인스턴스 (보안 강화)
  static const _secureStorage = FlutterSecureStorage();

  // ❌ 메모리 캐시 제거 - 보안 강화를 위해 메모리에 토큰 저장하지 않음
  // ✅ ApiService는 HTTP 요청을 위해서만 토큰 보유
  // ✅ Secure Storage의 보안 효과 유지

  // 앱 시작 시 저장된 토큰 로드
  static Future<void> loadTokens() async {
    try {
      final accessToken = await _secureStorage.read(key: 'access_token');

      // ApiService에만 토큰 설정 (HTTP 요청용)
      if (accessToken != null) {
        ApiService.setToken(accessToken);
      }
    } catch (e) {
      print('토큰 로드 실패: $e');
    }
  }

  // 토큰 저장 (Secure Storage만 사용)
  static Future<void> setTokens(
    String accessToken, {
    String? refreshToken,
  }) async {
    try {
      // Secure Storage에 암호화하여 저장
      await _secureStorage.write(key: 'access_token', value: accessToken);
      if (refreshToken != null) {
        await _secureStorage.write(key: 'refresh_token', value: refreshToken);
      }

      // ApiService에만 토큰 설정 (HTTP 인터셉터용)
      ApiService.setToken(accessToken);
    } catch (e) {
      print('토큰 저장 실패: $e');
    }
  }

  // 토큰 삭제 (Secure Storage + ApiService)
  static Future<void> clearTokens() async {
    try {
      // Secure Storage에서 삭제
      await _secureStorage.delete(key: 'access_token');
      await _secureStorage.delete(key: 'refresh_token');

      // ApiService의 토큰도 삭제
      ApiService.clearToken();
    } catch (e) {
      print('토큰 삭제 실패: $e');
    }
  }

  // 저장된 토큰 확인
  static Future<bool> hasValidToken() async {
    try {
      final accessToken = await _secureStorage.read(key: 'access_token');
      return accessToken != null && accessToken.isNotEmpty;
    } catch (e) {
      print('토큰 확인 실패: $e');
      return false;
    }
  }

  // 저장된 토큰 가져오기 (필요시에만 사용)
  static Future<String?> getAccessToken() async {
    try {
      return await _secureStorage.read(key: 'access_token');
    } catch (e) {
      print('토큰 조회 실패: $e');
      return null;
    }
  }

  // refresh 토큰 가져오기 (필요시에만 사용)
  static Future<String?> getRefreshToken() async {
    try {
      return await _secureStorage.read(key: 'refresh_token');
    } catch (e) {
      print('리프레시 토큰 조회 실패: $e');
      return null;
    }
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

        await setTokens(accessToken, refreshToken: refreshToken);

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
    await clearTokens();
    return true;
  }

  // 토큰 검증 및 자동 로그인
  static Future<User?> checkAuthStatus() async {
    try {
      // 저장된 토큰 로드
      // 저장된 토큰 로드
      await loadTokens();

      // 토큰이 있는지 확인
      final hasToken = await hasValidToken();
      if (!hasToken) return null;

      // 현재 사용자 정보 조회로 토큰 유효성 확인
      return await _getCurrentUser();
    } catch (e) {
      print('인증 상태 확인 실패: $e');
      // 토큰이 무효한 경우 삭제
      await clearTokens();
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
