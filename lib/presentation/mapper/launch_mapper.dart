import 'package:intl/intl.dart';
import 'package:task_rockets/data/model/launch/launch_model.dart';
import 'package:task_rockets/presentation/model/launch_ui.dart';

class LaunchMapper {
  static LaunchUi toUI(LaunchModel launchModel) {
    final launchDate = DateFormat(
      'dd/MM/yyyy',
    ).format(DateTime.parse(launchModel.launchDateTime));
    final launchTime = DateFormat(
      'hh:mm a',
    ).format(DateTime.parse(launchModel.launchDateTime));

    return LaunchUi(
      missionName: launchModel.missionName,
      launchDate: launchDate,
      launchTime: launchTime,
      siteName: launchModel.launchSite.siteName,
    );
  }
}
