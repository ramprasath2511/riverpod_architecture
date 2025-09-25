import 'package:techtest/core/data/pexels_api_service.dart';
import 'package:techtest/core/domain/image_model.dart';

class ImageRepository {
  ImageRepository(this.apiService);

  final PexelsApiService apiService;

  Future<List<ImageModel>> fetchPopularImages({int page = 0}) async {
    final models = await apiService.fetchPopularImages(page, 20);
    return models.photos.map(ImageModel.fromPexelsApiModel).toList();
  }

  Future<List<ImageModel>> searchImages(String query, {int page = 0}) async {
    final models = await apiService.searchImages(query, page, 20);
    return models.photos.map(ImageModel.fromPexelsApiModel).toList();
  }
}
