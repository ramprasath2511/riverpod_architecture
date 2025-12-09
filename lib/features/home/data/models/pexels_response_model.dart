import 'package:json_annotation/json_annotation.dart';
import 'package:techtest/features/home/data/models/pexels_api_model.dart';

part 'pexels_api_get_images_response_model.g.dart';

@JsonSerializable()
class PexelsApiGetImagesResponseModel {
  PexelsApiGetImagesResponseModel({
    required this.photos,
    required this.page,
    required this.perPage,
    required this.totalResults,
    this.nextPage,
  });

  factory PexelsApiGetImagesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PexelsApiGetImagesResponseModelFromJson(json);

  final List<PexelsApiModel> photos;
  final int page;
  @JsonKey(name: 'per_page')
  final int perPage;
  @JsonKey(name: 'total_results')
  final int totalResults;
  @JsonKey(name: 'next_page')
  final String? nextPage;

  Map<String, dynamic> toJson() =>
      _$PexelsApiGetImagesResponseModelToJson(this);
}
