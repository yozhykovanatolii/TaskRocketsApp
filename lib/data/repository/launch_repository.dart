import 'package:task_rockets/data/datasource/launch_client.dart';
import 'package:task_rockets/data/model/launch/launch_model.dart';

class LaunchRepository {
  final _launchClient = LaunchClient();

  Future<List<LaunchModel>> getAllLaunchesByRocketId(String rocketId) async {
    return await _launchClient.getAllLaunchesByRocketId(rocketId);
  }
}
