import 'package:flutter/material.dart';

import 'package:tetiharana/utilities/tools.dart';

class MyImagePicker extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final double? iconSize;

  const MyImagePicker({
    super.key,
    required this.icon,
    required this.iconColor,
    this.iconSize,
  });

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    _takePictureFromCamera() {}

    _takePictureFromGallery() {}

    takePictureButton() {
      return InkWell(
        onTap: () {
          showModalBottomSheet<void>(
            shape: const Border(
              left: BorderSide.none,
            ),
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                width: size.width,
                height: 207,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 15,
                        bottom: 10,
                      ),
                      child: Text(
                        "Choisir une action",
                        style: TextStyle(
                          color: Tools.color02,
                          fontSize: Tools.fontSize02,
                        ),
                      ),
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(30),
                              onTap: _takePictureFromCamera,
                              child: Image.asset(
                                "assets/images/icon/icon_camera.png",
                                fit: BoxFit.cover,
                                height: 60,
                              ),
                            ),
                            const Text(
                              "Camera",
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(30),
                              onTap: _takePictureFromGallery,
                              child: Image.asset(
                                "assets/images/icon/icon_gallery_2.png",
                                fit: BoxFit.cover,
                                height: 60,
                              ),
                            ),
                            const Text(
                              "Gallerie",
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    SizedBox(
                      width: size.width,
                      child: InkWell(
                        onTap: () => {Navigator.pop(context)},
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Annuler",
                              style: TextStyle(
                                fontSize: Tools.fontSize02,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(
          widget.icon,
          color: widget.iconColor,
          size: widget.iconSize,
        ),
      );
    }

    return takePictureButton();
  }
}
