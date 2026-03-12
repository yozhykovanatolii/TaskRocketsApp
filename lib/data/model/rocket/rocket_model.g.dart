// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RocketModel _$RocketModelFromJson(Map<String, dynamic> json) => RocketModel(
  rocketId: json['rocket_id'] as String,
  flickrImages: (json['flickr_images'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$RocketModelToJson(RocketModel instance) =>
    <String, dynamic>{
      'rocket_id': instance.rocketId,
      'flickr_images': instance.flickrImages,
    };
