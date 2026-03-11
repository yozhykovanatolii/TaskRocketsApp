import 'package:flutter/material.dart';
import 'package:task_rockets/presentation/page/home/widget/missions_loading_indicator.dart';
import 'package:task_rockets/presentation/page/home/widget/rocket_images_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'SpaceX Launches',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RocketImagesSlider(),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Missions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: MissionsLoadingIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
