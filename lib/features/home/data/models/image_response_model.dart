import 'package:json_annotation/json_annotation.dart';
import 'package:techtest/features/home/data/models/image_api_model.dart';

part 'image_api_get_images_response_model.g.dart';

@JsonSerializable()
class ImageApiGetImagesResponseModel {
  ImageApiGetImagesResponseModel({
    required this.data,
    required this.success,
    required this.status,
  });

  factory ImageApiGetImagesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ImageApiGetImagesResponseModelFromJson(json);

  final List<ImageApiModel> data;
  final bool success;
  final int status;

  Map<String, dynamic> toJson() => _$ImageApiGetImagesResponseModelToJson(this);
}
