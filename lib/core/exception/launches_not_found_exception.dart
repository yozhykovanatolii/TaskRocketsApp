class LaunchesNotFoundException implements Exception {
  final String errorMessage;

  LaunchesNotFoundException([this.errorMessage = 'ailed to load launches']);
}
