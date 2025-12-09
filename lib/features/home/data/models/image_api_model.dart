import 'package:json_annotation/json_annotation.dart';

part 'image_api_model.g.dart';

@JsonSerializable()
class ImageApiModel {
  const ImageApiModel({
    required this.id,
    required this.title,
    required this.width,
    required this.height,
    this.author,
  });

  factory ImageApiModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String;
    final title = json['title'] ?? 'No Title';
    final images = json['images'];
    final imageData = (images is List && images.isNotEmpty)
        ? images.first as Map<String, dynamic>
        : json;
    final width = imageData['width'] is int ? imageData['width'] as int : 1;
    final height = imageData['height'] is int ? imageData['height'] as int : 1;
    final author = json['account_url'] as String?;

    return ImageApiModel(
      id: id,
      title: title,
      width: width,
      height: height,
      author: author,
    );
  }

  final String id;
  final String title;
  final int width;
  final int height;
  final String? author;

  String get thumbnailUrl {
    // This method is still needed for the fromApiModel conversion
    // but since we removed imageUrl, we'll need to reconstruct it from the JSON
    // For now, returning empty string as this model is not actually used
    return '';
  }
}
