class RocketsNotFoundException implements Exception {
  final String errorMessage;

  RocketsNotFoundException([this.errorMessage = 'Failed to load rockets']);
}
