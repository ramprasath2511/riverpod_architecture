import 'package:techtest/core/data/image_api_model.dart';
import 'package:techtest/core/data/pexels_api_model.dart';

class ImageModel {
  const ImageModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.author,
  });

  factory ImageModel.fromApiModel(ImageApiModel model) {
    return ImageModel(
      id: model.id,
      title: model.title,
      imageUrl: model.thumbnailUrl,
      width: model.width,
      height: model.height,
      author: model.author,
    );
  }

  factory ImageModel.fromPexelsApiModel(PexelsApiModel model) {
    return ImageModel(
      id: model.id.toString(),
      title: model.title,
      imageUrl: model.thumbnailUrl,
      width: model.width,
      height: model.height,
      author: model.author,
    );
  }

  final String id;
  final String title;
  final String imageUrl;
  final int width;
  final int height;
  final String? author;
}
