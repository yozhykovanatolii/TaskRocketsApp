import 'package:flutter/material.dart';

class MissionsLoadingIndicator extends StatelessWidget {
  const MissionsLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: 1.2,
        child: CircularProgressIndicator(
          color: const Color(0xFFBAFC54).withValues(
            alpha: 0.25,
          ),
        ),
      ),
    );
  }
}
