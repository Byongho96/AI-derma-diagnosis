import '../services/api_service.dart';
import '../models/user.dart';

class UserRepository {
  // 현재 사용자 정보 조회
  static Future<User?> getCurrentUser() async {
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

  // // 사용자 프로필 업데이트
  // static Future<User?> updateProfile({
  //   String? username,
  //   String? email,
  // }) async {
  //   try {
  //     final data = <String, dynamic>{};
  //     if (username != null) data['username'] = username;
  //     if (email != null) data['email'] = email;

  //     final response = await ApiService.put('/api/v1/users/me', data: data);
  //     if (response.statusCode == 200) {
  //       return User.fromJson(response.data);
  //     }
  //   } catch (e) {
  //     print('프로필 업데이트 실패: $e');
  //   }
  //   return null;
  // }

  // // 프로필 이미지 업로드
  // static Future<User?> uploadProfileImage(String imagePath) async {
  //   try {
  //     final response = await ApiService.uploadFile(
  //       '/api/v1/users/me/profile-image',
  //       imagePath,
  //       'profile_image',
  //     );
  //     if (response.statusCode == 200) {
  //       return User.fromJson(response.data);
  //     }
  //   } catch (e) {
  //     print('프로필 이미지 업로드 실패: $e');
  //   }
  //   return null;
  // }

  // // 사용자 리스트 조회
  // static Future<List<User>> getUsers({int page = 1, int limit = 10}) async {
  //   try {
  //     final response = await ApiService.get(
  //       '/api/v1/users',
  //       params: {'page': page, 'limit': limit},
  //     );
  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = response.data['users'] ?? response.data;
  //       return data.map((json) => User.fromJson(json)).toList();
  //     }
  //   } catch (e) {
  //     print('사용자 리스트 조회 실패: $e');
  //   }
  //   return [];
  // }
}
