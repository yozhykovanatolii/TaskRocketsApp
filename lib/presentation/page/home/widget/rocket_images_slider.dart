import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_rockets/presentation/bloc/rocket_cubit.dart';

class RocketImagesSlider extends StatelessWidget {
  const RocketImagesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final rocketsUI = context.select(
      (RocketCubit rocketCubit) => rocketCubit.state.rockets,
    );
    return Column(
      spacing: 10,
      children: [
        CarouselSlider.builder(
          itemCount: rocketsUI.length,
          itemBuilder: (context, index, realIndex) {
            return _RocketImage(
              rocketImage: rocketsUI[index].flickrImage,
            );
          },
          options: CarouselOptions(
            enlargeCenterPage: true,
            viewportFraction: 0.78,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            enlargeFactor: 0.25,
            onPageChanged: (index, reason) {
              context.read<RocketCubit>().fetchRocketsLaunches(index);
            },
          ),
        ),
        _DotIndicator(rocketsCount: rocketsUI.length),
      ],
    );
  }
}

class _RocketImage extends StatelessWidget {
  final String rocketImage;

  const _RocketImage({required this.rocketImage});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        rocketImage,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}

class _DotIndicator extends StatelessWidget {
  final int rocketsCount;

  const _DotIndicator({required this.rocketsCount});

  @override
  Widget build(BuildContext context) {
    final currentRocketIndex = context.select(
      (RocketCubit rocketCubit) => rocketCubit.state.currentRocketIndex,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        rocketsCount,
        (index) => Container(
          height: 10,
          width: 10,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentRocketIndex == index
                ? Colors.white
                : Colors.transparent,
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
