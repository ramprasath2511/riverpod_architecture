import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:techtest/config/config.dart';
import 'package:techtest/core/data/pexels_api_service.dart';
import 'package:techtest/core/domain/image_repository.dart';

void registerDependencies() {
  final getIt = GetIt.I;

  getIt
    ..registerSingleton(_createDio())
    ..registerSingleton(PexelsApiService(getIt<Dio>()))
    ..registerSingleton(ImageRepository(getIt<PexelsApiService>()));
}

Dio _createDio() {
  return Dio(
    BaseOptions(
      headers: {
        'Authorization': pexelsApiKey,
      },
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
}
