import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_rockets/core/exception/launches_not_found_exception.dart';
import 'package:task_rockets/data/repository/launch_repository.dart';
import 'package:task_rockets/data/repository/rocket_repository.dart';
import 'package:task_rockets/presentation/bloc/rocket_state.dart';

class RocketCubit extends Cubit<RocketState> {
  final RocketRepository _rocketRepository;
  final LaunchRepository _launchRepository;

  RocketCubit(this._rocketRepository, this._launchRepository)
    : super(RocketState.initial());

  Future<void> fetchData() async {
    final rockets = await _rocketRepository.getAllRockets();
    emit(state.copyWith(rockets: rockets));
    await fetchRocketsLaunches(rockets.first.rocketId, 0);
  }

  Future<void> fetchRocketsLaunches(String rocketId, int index) async {
    emit(
      state.copyWith(
        launchStatus: LaunchStatus.loading,
        currentRocketIndex: index,
      ),
    );
    try {
      final rocketLaunches = await _launchRepository.getAllLaunchesByRocketId(
        rocketId,
      );
      emit(
        state.copyWith(
          rocketLaunches: rocketLaunches,
          launchStatus: LaunchStatus.success,
        ),
      );
    } on LaunchesNotFoundException catch (exception) {
      emit(
        state.copyWith(
          errorMessage: exception.errorMessage,
          launchStatus: LaunchStatus.failure,
        ),
      );
    }
  }
}
