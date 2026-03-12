import 'package:json_annotation/json_annotation.dart';
import 'package:task_rockets/data/model/launch_site/launch_site_model.dart';

part 'launch_model.g.dart';

@JsonSerializable()
class LaunchModel {
  @JsonKey(name: 'mission_name')
  final String missionName;
  @JsonKey(name: 'launch_date_local')
  final String launchDateTime;
  @JsonKey(name: 'launch_site')
  final LaunchSiteModel launchSite;

  LaunchModel({
    required this.missionName,
    required this.launchDateTime,
    required this.launchSite,
  });

  Map<String, dynamic> toJson() => _$LaunchModelToJson(this);

  factory LaunchModel.fromJson(Map<String, dynamic> json) =>
      _$LaunchModelFromJson(json);
}
