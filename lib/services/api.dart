import 'dart:io';

import 'package:dio/dio.dart';

class Api {
  static String baseUrl = 'put-base-url-here';
  Dio _dio;
  var options;

  String _authToken = '';

  /// Add Authorization header
  set authToken(String token) {
    _authToken = token;
    if (_authToken != null && token.isNotEmpty) {
      _dio.options.headers = <String, dynamic>{
        "Authorization": _authToken,
      };
    }
  }

  // Getters for API end-points
  static String get endpoint1 => 'endpoint1';
  Api() {
    options = BaseOptions(
      baseUrl: baseUrl,
    );
    _dio = new Dio(options);
  }

  // ignore: non_constant_identifier_names
  Future<Response<dynamic>> GET(String path) async {
    // debugPrint(path);
    Response<dynamic> response;
    try {
      response = await _dio.get(path);
      // debugPrint(response);
    } on SocketException catch (e) {
      print("Socket exception:");
      print(e);
    } on DioError catch (e) {
      print("DioError");
      print(e.response);
      if (e.type == DioErrorType.response) {
        return e.response;
      } else
        return null;
    } on FormatException catch (e) {
      print("Server returned an invalid response");
      print(e.message);
    }
    return response;
  }

  // ignore: non_constant_identifier_names
  Future<Response<dynamic>> POST(String path, Map<String, dynamic> body) async {
    Response<dynamic> response;
    try {
      response = await _dio.post(path, data: body);
      // print(response);
    } on SocketException catch (e) {
      print(e);
    } on DioError catch (e) {
      print(e);
      if (e != null && e.type == DioErrorType.response) {
        return e.response;
      } else
        return null;
    } on FormatException catch (e) {
      print("Server returned an invalid response");
      print(e.message);
    }
    return response;
  }

  // ignore: non_constant_identifier_names
  Future<Response<dynamic>> PUT(String path, Map<String, dynamic> body) async {
    print(path);
    Response<dynamic> response;

    try {
      response = await _dio.put(path, data: body);
      print(response);
    } on SocketException catch (e) {
      print("Socket exception:");
      print(e);
    } on DioError catch (e) {
      print("DioError:");
      print(e);
      if (e != null && e.type == DioErrorType.response) {
        print(e.type);
        return e.response;
      } else
        return null;
    } on FormatException catch (e) {
      print("Server returned an invalid response");
      print(e.message);
    }
    return response;
  }
}
