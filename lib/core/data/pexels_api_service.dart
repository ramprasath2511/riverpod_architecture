import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:techtest/core/data/pexels_api_get_images_response_model.dart';

part 'pexels_api_service.g.dart';

@RestApi(baseUrl: 'https://api.pexels.com/v1')
abstract class PexelsApiService {
  factory PexelsApiService(Dio dio, {String baseUrl}) = _PexelsApiService;

  @GET('/curated')
  Future<PexelsApiGetImagesResponseModel> fetchPopularImages(
    @Query('page') int page,
    @Query('per_page') int perPage,
  );

  @GET('/search')
  Future<PexelsApiGetImagesResponseModel> searchImages(
    @Query('query') String query,
    @Query('page') int page,
    @Query('per_page') int perPage,
  );
}
