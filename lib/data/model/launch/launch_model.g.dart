// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchModel _$LaunchModelFromJson(Map<String, dynamic> json) => LaunchModel(
  missionName: json['mission_name'] as String,
  launchDateTime: json['launch_date_utc'] as String,
  launchSite: LaunchSiteModel.fromJson(
    json['launch_site'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$LaunchModelToJson(LaunchModel instance) =>
    <String, dynamic>{
      'mission_name': instance.missionName,
      'launch_date_utc': instance.launchDateTime,
      'launch_site': instance.launchSite,
    };
