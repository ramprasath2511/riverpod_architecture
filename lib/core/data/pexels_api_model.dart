import 'package:json_annotation/json_annotation.dart';

part 'pexels_api_model.g.dart';

@JsonSerializable()
class PexelsApiModel {
  const PexelsApiModel({
    required this.id,
    required this.width,
    required this.height,
    required this.photographer,
    required this.src,
    required this.alt,
  });

  factory PexelsApiModel.fromJson(Map<String, dynamic> json) {
    return _$PexelsApiModelFromJson(json);
  }

  final int id;
  final int width;
  final int height;
  final String photographer;
  final PexelsSrcModel src;
  final String alt;

  String get imageUrl => src.original;
  String get thumbnailUrl => src.medium;
  String get title => alt.isNotEmpty ? alt : 'Photo by $photographer';
  String? get author => photographer;
}

@JsonSerializable()
class PexelsSrcModel {
  const PexelsSrcModel({
    required this.original,
    required this.medium,
  });

  factory PexelsSrcModel.fromJson(Map<String, dynamic> json) {
    return _$PexelsSrcModelFromJson(json);
  }

  final String original;
  final String medium;
}
