import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_rockets/presentation/bloc/rocket_cubit.dart';
import 'package:task_rockets/presentation/bloc/rocket_state.dart';
import 'package:task_rockets/presentation/page/home/widget/mission_card.dart';
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
            fontFamily: 'Inter',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RocketImagesSlider(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Missions',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<RocketCubit, RocketState>(
                builder: (context, state) {
                  if (state.launchStatus == LaunchStatus.failure) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                  if (state.launchStatus == LaunchStatus.success) {
                    final rocketLaunches = state.rocketLaunches;
                    return ListView.builder(
                      itemCount: rocketLaunches.length,
                      itemBuilder: (context, index) {
                        return MissionCard(
                          launchUI: rocketLaunches[index],
                        );
                      },
                    );
                  }
                  return const MissionsLoadingIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
