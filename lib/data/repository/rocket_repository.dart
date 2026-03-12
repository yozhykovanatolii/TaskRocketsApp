import 'package:task_rockets/data/datasource/rocket_client.dart';
import 'package:task_rockets/data/model/rocket/rocket_model.dart';

class RocketRepository {
  final RocketClient _rocketClient;

  RocketRepository(this._rocketClient);

  Future<List<RocketModel>> getAllRockets() async {
    return await _rocketClient.getAllRockets();
  }
}
