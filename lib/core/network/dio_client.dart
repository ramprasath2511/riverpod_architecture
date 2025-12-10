import 'package:dio/dio.dart';
import 'package:techtest/config/config.dart';
import 'package:techtest/core/network/network_handler.dart';

Dio createDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Authorization': pexelsApiKey,
      },
    ),
  );
  // Add connectivity check
  dio.interceptors.add(ConnectivityInterceptor());

  // Optional: Add logging
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
  ));

  return dio;
}