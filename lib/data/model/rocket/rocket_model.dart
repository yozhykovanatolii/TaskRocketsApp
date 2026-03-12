import 'package:json_annotation/json_annotation.dart';

part 'rocket_model.g.dart';

@JsonSerializable()
class RocketModel {
  @JsonKey(name: 'rocket_id')
  final String rocketId;
  @JsonKey(name: 'flickr_images')
  final List<String> flickrImages;

  RocketModel({
    required this.rocketId,
    required this.flickrImages,
  });

  Map<String, dynamic> toJson() => _$RocketModelToJson(this);

  factory RocketModel.fromJson(Map<String, dynamic> json) =>
      _$RocketModelFromJson(json);
}
