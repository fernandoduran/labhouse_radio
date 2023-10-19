import 'dart:async';
import 'dart:io';
import "package:dio/dio.dart";
import '../../constants/globals.dart';

class ApiClient {
  // Build a Singleton
  static final ApiClient _apiClient = ApiClient._internal();

  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal();

  // Default headers
  final Map<String, String> _headers = {
    "Access-Control-Allow-Origin": "*",
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.acceptHeader: "*"
  };

  Dio init() {
    // Connection Options
    BaseOptions _options = BaseOptions(
      connectTimeout: Duration(milliseconds: Globals.timeout), //5000
      receiveTimeout: Duration(milliseconds: Globals.timeout),
      baseUrl: Globals.apiUrl + Globals.jsonFormat,
      headers: _headers,
    );

    // Create client
    Dio _dio = Dio(_options);

    // Add interceptors
    _dio.interceptors.add(ApiInterceptors());

    return _dio;
  }
}

class ApiInterceptors extends Interceptor {

  @override
  Future<dynamic> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
  
    // Continue request execution
    return handler.next(options);
  }

  @override
  onError(DioException err, ErrorInterceptorHandler handler) {
    String? error = err.response?.data['error'];

    if(error != null) return handler.resolve(err.response!);

    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    
   return handler.next(response);
  }
}