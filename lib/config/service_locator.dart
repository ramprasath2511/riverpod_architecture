import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:techtest/core/network/dio_client.dart';
import 'package:techtest/features/home/data/services/pexels_api_service.dart';
import 'package:techtest/features/home/data/repositories/image_repository.dart';

import '../features/home/data/repositories/favorite_repository.dart';
import '../features/home/data/services/favorite_service.dart';

void registerDependencies() {
  final getIt = GetIt.I;

  getIt
    ..registerSingleton(createDio())
    ..registerSingleton(PexelsApiService(getIt<Dio>()))
    ..registerSingleton(ImageRepository(getIt<PexelsApiService>()))
    ..registerSingleton(FavouritesService())
    ..registerSingleton(FavoritesRepository(getIt<FavouritesService>()));
  
}


