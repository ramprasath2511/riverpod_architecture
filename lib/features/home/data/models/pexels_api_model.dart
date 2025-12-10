import 'package:json_annotation/json_annotation.dart';

part 'pexels_api_model.g.dart';

@JsonSerializable()
class PexelsApiModel {
  const PexelsApiModel({
     this.id,
     this.width,
     this.height,
     this.photographer,
     this.src,
     this.alt,
  });

  factory PexelsApiModel.fromJson(Map<String, dynamic> json) {
    return _$PexelsApiModelFromJson(json);
  }

  final int? id;
  final int? width;
  final int? height;
  final String? photographer;
  final PexelsSrcModel? src;
  final String? alt;

  String get imageUrl => src?.original ?? '';
  String get thumbnailUrl => src?.medium ?? '';
  String get title => (alt?.isNotEmpty ?? false) ? alt! : 'Photo by ${photographer ?? "Unknown"}';
  String get author => photographer ?? 'Unknown';
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
