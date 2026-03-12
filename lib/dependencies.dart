import 'package:get_it/get_it.dart';
import 'package:task_rockets/data/datasource/launch_client.dart';
import 'package:task_rockets/data/datasource/rocket_client.dart';
import 'package:task_rockets/data/repository/launch_repository.dart';
import 'package:task_rockets/data/repository/rocket_repository.dart';
import 'package:task_rockets/presentation/bloc/rocket_cubit.dart';

class Dependencies {
  static final _getIt = GetIt.instance;

  static void setupDependencies() {
    _setupDataSources();
    _setupRepositories();
    _setupCubit();
  }

  static void _setupDataSources() {
    _getIt.registerSingleton<RocketClient>(RocketClient());
    _getIt.registerSingleton<LaunchClient>(LaunchClient());
  }

  static void _setupRepositories() {
    _getIt.registerFactory<RocketRepository>(
      () => RocketRepository(_getIt<RocketClient>()),
    );
    _getIt.registerFactory<LaunchRepository>(
      () => LaunchRepository(_getIt<LaunchClient>()),
    );
  }

  static void _setupCubit() {
    _getIt.registerFactory<RocketCubit>(
      () => RocketCubit(
        _getIt<RocketRepository>(),
        _getIt<LaunchRepository>(),
      ),
    );
  }
}
