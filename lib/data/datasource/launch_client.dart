import 'dart:convert';
import 'package:task_rockets/core/exception/launches_not_found_exception.dart';
import 'package:task_rockets/data/model/launch/launch_model.dart';
import 'package:http/http.dart' as http;

class LaunchClient {
  Future<List<LaunchModel>> getAllLaunchesByRocketId(String rocketId) async {
    final response = await http.get(
      Uri.parse('https://api.spacexdata.com/v3/launches?rocket_id=$rocketId'),
    );
    if (response.statusCode != 200) throw LaunchesNotFoundException();

    final List<dynamic> data = jsonDecode(response.body);

    if (data.isEmpty) {
      throw LaunchesNotFoundException('No launches found for this rocket');
    }
    return data.map((launchJson) => LaunchModel.fromJson(launchJson)).toList();
  }
}
