import 'package:flutter/material.dart';

import 'package:tetiharana/utilities/tools.dart';

class MyBackgroundImage extends StatefulWidget {
  final String source;
  const MyBackgroundImage({
    super.key,
    required this.source,
  });

  @override
  State<MyBackgroundImage> createState() => _MyBackgroundImageState();
}

class _MyBackgroundImageState extends State<MyBackgroundImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Tools.imageHeight01,
      decoration: BoxDecoration(
        gradient: Tools.gradient06,
        borderRadius: BorderRadius.circular(Tools.radius01),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            widget.source,
          ),
          alignment: Alignment.topCenter,
          // colorFilter: ColorFilter.mode(
          //   Tools.color11,
          //   BlendMode.darken,
          // ),
        ),
      ),
    );
  }
}
