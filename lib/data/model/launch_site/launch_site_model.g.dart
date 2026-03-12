// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_site_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchSiteModel _$LaunchSiteModelFromJson(Map<String, dynamic> json) =>
    LaunchSiteModel(
      siteId: json['site_id'] as String,
      siteName: json['site_name_long'] as String,
    );

Map<String, dynamic> _$LaunchSiteModelToJson(LaunchSiteModel instance) =>
    <String, dynamic>{
      'site_id': instance.siteId,
      'site_name_long': instance.siteName,
    };
