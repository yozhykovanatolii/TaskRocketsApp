import 'package:task_rockets/data/model/rocket/rocket_model.dart';
import 'package:task_rockets/presentation/model/rocket_ui.dart';

class RocketMapper {
  static RocketUi toUI(RocketModel rocketModel) {
    return RocketUi(
      id: rocketModel.rocketId,
      flickrImage: rocketModel.flickrImages.first,
    );
  }
}
