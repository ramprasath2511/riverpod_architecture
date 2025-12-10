import 'package:techtest/features/home/data/models/pexels_response_model.dart';
import 'package:techtest/features/home/data/models/pexels_api_model.dart';

final sampleImageJson = {
  'id': 123456,
  'width': 640,
  'height': 480,
  'photographer': 'John Doe',
  'src': {
    'original':
        'https://images.pexels.com/photos/123456/pexels-photo-123456.jpeg',
    'medium':
        'https://images.pexels.com/photos/123456/pexels-photo-123456.jpeg?auto=compress&cs=tinysrgb&h=350',
  },
  'alt': 'A Cat',
};

final sampleImageModel = PexelsApiModel.fromJson(sampleImageJson);

final sampleImageResponse = PexelsApiGetImagesResponseModel(
  photos: [sampleImageModel],
  page: 1,
  perPage: 20,
  totalResults: 100,
  nextPage: 'https://api.pexels.com/v1/curated?page=2&per_page=20',
);

final emptyImageResponse = PexelsApiGetImagesResponseModel(
  photos: [],
  page: 1,
  perPage: 20,
  totalResults: 0,
);
