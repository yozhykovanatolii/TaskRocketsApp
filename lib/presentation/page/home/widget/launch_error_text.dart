import 'package:flutter/material.dart';

class LaunchErrorText extends StatelessWidget {
  final String errorMessage;

  const LaunchErrorText({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
