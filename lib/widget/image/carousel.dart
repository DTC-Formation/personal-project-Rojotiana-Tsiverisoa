import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:tetiharana/utilities/tools.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({super.key});

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  List imageList = [
    {
      "id": 1,
      "image_path": "assets/images/familly/familly_1.webp",
    },
    {
      "id": 2,
      "image_path": "assets/images/familly/familly_2.webp",
    },
    {
      "id": 3,
      "image_path": "assets/images/familly/familly_3.webp",
    },
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CarouselSlider(
          items: imageList
              .map(
                (item) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Tools.radius01),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        item['image_path'],
                      ),
                      alignment: Alignment.topCenter,
                      colorFilter: const ColorFilter.mode(
                        Tools.color11,
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          carouselController: carouselController,
          options: CarouselOptions(
            height: Tools.imageHeight01,
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlay: true,
            // aspectRatio: 2,
            enlargeCenterPage: false,
            viewportFraction: 1.0,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currentIndex == entry.key ? 17 : 7,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Tools.radius01),
                      color: currentIndex == entry.key
                          ? Tools.color12
                          : Tools.color13),
                ),
              );
            }).toList(),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Tools.radius01,
                ),
              ),
              width: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        width: size.width,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(
                            Tools.radius01,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Apprenez plus sur l\'histoire de votre famille',
                    style: TextStyle(
                      color: Tools.color05,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
