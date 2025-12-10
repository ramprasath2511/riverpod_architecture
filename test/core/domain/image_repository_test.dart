import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:techtest/core/error/error_logger.dart';
import 'package:techtest/features/home/data/services/pexels_api_service.dart';
import 'package:techtest/features/home/domain/entities/image_model.dart';
import 'package:techtest/features/home/data/repositories/image_repository.dart';

import '../image_fixtures.dart';

class MockPexelsApiService extends Mock implements PexelsApiService {}

void main() {
  late MockPexelsApiService mockApiService;
  late ImageRepository imageRepository;

  setUp(() {
    mockApiService = MockPexelsApiService();
    imageRepository = ImageRepository(mockApiService);
  });

  group('ImageRepository', () {
    test('fetchPopularImages returns converted models', () async {
      when(() => mockApiService.fetchPopularImages(any(), any())).thenAnswer(
        (_) async => sampleImageResponse,
      );

      final result = await imageRepository.fetchPopularImages();

      expect(result, isA<List<ImageModel>>());
      expect(result.first.id, equals(sampleImageModel.id.toString()));
    });

    test('searchImages returns converted models', () async {
      when(() => mockApiService.searchImages('cat', any(), any())).thenAnswer(
        (_) async => sampleImageResponse,
      );

      final result = await imageRepository.searchImages('cat');

      expect(result.length, equals(1));
      expect(result.first.title, equals(sampleImageModel.title));
    });
  });

  group('ImageModel', () {
    test('fromPexelsApiModel converts correctly', () {
      final domainModel = ImageModel.fromPexelsApiModel(sampleImageModel);

      expect(domainModel.id, sampleImageModel.id.toString());
      expect(domainModel.imageUrl, sampleImageModel.thumbnailUrl);
      expect(domainModel.title, sampleImageModel.title);
      expect(domainModel.author, sampleImageModel.author);
    });
  });

}
