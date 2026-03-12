import 'package:json_annotation/json_annotation.dart';

part 'launch_site_model.g.dart';

@JsonSerializable()
class LaunchSiteModel {
  @JsonKey(name: 'site_id')
  final String siteId;
  @JsonKey(name: 'site_name_long')
  final String siteName;

  LaunchSiteModel({
    required this.siteId,
    required this.siteName,
  });

  Map<String, dynamic> toJson() => _$LaunchSiteModelToJson(this);

  factory LaunchSiteModel.fromJson(Map<String, dynamic> json) =>
      _$LaunchSiteModelFromJson(json);
}
