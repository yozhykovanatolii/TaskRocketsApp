import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_rockets/core/exception/rockets_not_found_exception.dart';
import 'package:task_rockets/data/model/rocket/rocket_model.dart';

class RocketClient {
  Future<List<RocketModel>> getAllRockets() async {
    final response = await http.get(
      Uri.parse('https://api.spacexdata.com/v3/rockets'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((rocketJson) => RocketModel.fromJson(rocketJson))
          .toList();
    } else {
      throw RocketsNotFoundException();
    }
  }
}
