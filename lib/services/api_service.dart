import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// 간단한 API 서비스 클래스
class ApiService {
  static final Dio _dio = _createDio();
  static String? _accessToken;

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL'] ?? 'http://localhost:8000',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // 인터셉터 추가 - 모든 요청에 Authorization 헤더 자동 추가
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_accessToken != null) {
            options.headers['Authorization'] = 'Bearer $_accessToken';
          }
          handler.next(options);
        },
      ),
    );

    return dio;
  }

  // 토큰 설정
  static void setToken(String? token) {
    _accessToken = token;
  }

  // 토큰 삭제
  static void clearToken() {
    _accessToken = null;
  }

  // GET 요청
  static Future<Response> get(String endpoint, {Map<String, dynamic>? params}) {
    return _dio.get(endpoint, queryParameters: params);
  }

  // POST 요청
  static Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  // PUT 요청
  static Future<Response> put(String endpoint, {dynamic data}) {
    return _dio.put(endpoint, data: data);
  }

  // DELETE 요청
  static Future<Response> delete(String endpoint) {
    return _dio.delete(endpoint);
  }

  // 파일 업로드
  static Future<Response> uploadFile(
    String endpoint,
    String filePath,
    String fieldName,
  ) async {
    final formData = FormData.fromMap({
      fieldName: await MultipartFile.fromFile(filePath),
    });
    return _dio.post(endpoint, data: formData);
  }
}
