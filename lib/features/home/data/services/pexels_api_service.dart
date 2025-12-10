import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:techtest/features/home/data/models/pexels_response_model.dart';

part 'pexels_api_service.g.dart';

@RestApi()
abstract class PexelsApiService {
  factory PexelsApiService(Dio dio) = _PexelsApiService;

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
