import 'package:flutter_test/flutter_test.dart';
import 'package:techtest/features/home/domain/entities/image_model.dart';

import '../image_fixtures.dart';

void main() {
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
