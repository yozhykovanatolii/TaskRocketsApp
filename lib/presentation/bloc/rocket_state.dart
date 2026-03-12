import 'package:task_rockets/presentation/model/launch_ui.dart';
import 'package:task_rockets/presentation/model/rocket_ui.dart';

enum LaunchStatus { initial, loading, success, failure }

class RocketState {
  final List<RocketUi> rockets;
  final List<LaunchUi> rocketLaunches;
  final int currentRocketIndex;
  final String errorMessage;
  final LaunchStatus launchStatus;

  RocketState({
    required this.rockets,
    required this.rocketLaunches,
    required this.currentRocketIndex,
    required this.errorMessage,
    required this.launchStatus,
  });

  factory RocketState.initial() {
    return RocketState(
      rockets: [],
      rocketLaunches: [],
      currentRocketIndex: 0,
      errorMessage: '',
      launchStatus: LaunchStatus.initial,
    );
  }

  RocketState copyWith({
    List<RocketUi>? rockets,
    List<LaunchUi>? rocketLaunches,
    int? currentRocketIndex,
    String? errorMessage,
    LaunchStatus? launchStatus,
  }) {
    return RocketState(
      rockets: rockets ?? this.rockets,
      rocketLaunches: rocketLaunches ?? this.rocketLaunches,
      currentRocketIndex: currentRocketIndex ?? this.currentRocketIndex,
      errorMessage: errorMessage ?? this.errorMessage,
      launchStatus: launchStatus ?? this.launchStatus,
    );
  }
}
