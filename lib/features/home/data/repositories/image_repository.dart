import 'package:techtest/features/home/data/services/pexels_api_service.dart';
import 'package:techtest/features/home/domain/entities/image_model.dart';

class ImageRepository {
  ImageRepository(this.apiService);

  final PexelsApiService apiService;

  Future<List<ImageModel>> fetchPopularImages({int page = 0}) async {
    final models = await apiService.fetchPopularImages(page, 20);
    final images =  models.photos.map(ImageModel.fromPexelsApiModel).toList();
    _cacheImages(images);
    return images;
  }

  Future<List<ImageModel>> searchImages(String query, {int page = 0}) async {
    final models = await apiService.searchImages(query, page, 20);
    final images = models.photos.map(ImageModel.fromPexelsApiModel).toList();
    _cacheImages(images);
    return images;
  }

  void _cacheImages(List<ImageModel> images) {
    for (final image in images) {
      _cache[image.id] = image;
    }
  }

  final Map<String, ImageModel> _cache = {};

  List<ImageModel> getImagesByIdsFromCache(List<String> ids) {
    return ids.map((id) => _cache[id]).whereType<ImageModel>().toList();
  }
}
