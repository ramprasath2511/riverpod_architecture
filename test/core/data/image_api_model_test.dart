import 'package:flutter_test/flutter_test.dart';
import 'package:techtest/features/home/data/models/pexels_api_model.dart';

import '../image_fixtures.dart';

void main() {
  group('PexelsApiModel.fromJson', () {
    test('parses all fields correctly from full JSON', () {
      final model = PexelsApiModel.fromJson(sampleImageJson);

      expect(model.id, equals(123456));
      expect(model.title, equals('A Cat'));
      expect(
        model.imageUrl,
        equals(
          'https://images.pexels.com/photos/123456/pexels-photo-123456.jpeg',
        ),
      );
      expect(model.width, equals(640));
      expect(model.height, equals(480));
      expect(model.photographer, equals('John Doe'));
      expect(model.alt, equals('A Cat'));

      expect(
        model.thumbnailUrl,
        equals(
          'https://images.pexels.com/photos/123456/pexels-photo-123456.jpeg?auto=compress&cs=tinysrgb&h=350',
        ),
      );
      expect(model.author, equals('John Doe'));
    });

    test('parses null JSON for negative scenario', () {
      final model = PexelsApiModel.fromJson({});

      expect(model.id, isNull);
      expect(model.imageUrl, isEmpty);
      expect(model.src, isNull);
    });
  });

}
