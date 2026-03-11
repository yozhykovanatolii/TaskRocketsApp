import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class RocketImagesSlider extends StatefulWidget {
  const RocketImagesSlider({super.key});

  @override
  State<RocketImagesSlider> createState() => _RocketImagesSliderState();
}

class _RocketImagesSliderState extends State<RocketImagesSlider> {
  int _currentIndex = 0;

  final _images = [
    'https://picsum.photos/id/1018/600/400',
    'https://picsum.photos/id/1015/600/400',
    'https://picsum.photos/id/1016/600/400',
    'https://picsum.photos/id/1016/600/400',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        CarouselSlider.builder(
          itemCount: _images.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(_images[index]),
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
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _images
              .asMap()
              .entries
              .map(
                (item) => Container(
                  height: 10,
                  width: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == item.key
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
        ),
      ],
    );
  }
}
