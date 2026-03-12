import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_rockets/data/model/rocket/rocket_model.dart';
import 'package:task_rockets/presentation/bloc/rocket_cubit.dart';

class RocketImagesSlider extends StatelessWidget {
  const RocketImagesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final rockets = context.select(
      (RocketCubit rocketCubit) => rocketCubit.state.rockets,
    );
    return Column(
      spacing: 10,
      children: [
        CarouselSlider.builder(
          itemCount: rockets.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    rockets[index].flickrImages.first,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 250,
            enlargeCenterPage: true,
            viewportFraction: 0.78,
            onPageChanged: (index, reason) {
              context.read<RocketCubit>().fetchRocketsLaunches(
                rockets[index].rocketId,
                index,
              );
            },
          ),
        ),
        _DotIndicator(rockets: rockets),
      ],
    );
  }
}

class _DotIndicator extends StatelessWidget {
  final List<RocketModel> rockets;

  const _DotIndicator({required this.rockets});

  @override
  Widget build(BuildContext context) {
    final currentRocketIndex = context.select(
      (RocketCubit rocketCubit) => rocketCubit.state.currentRocketIndex,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rockets
          .asMap()
          .entries
          .map(
            (item) => Container(
              height: 10,
              width: 10,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentRocketIndex == item.key
                    ? Colors.white
                    : Colors.transparent,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
