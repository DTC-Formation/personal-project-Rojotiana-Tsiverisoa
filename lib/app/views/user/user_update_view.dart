import 'package:flutter/material.dart';

import 'package:tetiharana/widget/navigation/app_bar.dart';
import 'package:tetiharana/widget/button/button.dart';
import 'package:tetiharana/widget/navigation/drawer.dart';
import 'package:tetiharana/widget/image/background_image.dart';
import 'package:tetiharana/widget/input/image_picker.dart';
import 'package:tetiharana/utilities/tools.dart';

enum SexeChoice { male, female }

class UserUpdateView extends StatefulWidget {
  const UserUpdateView({super.key});

  @override
  State<UserUpdateView> createState() => _UserUpdateViewState();
}

class _UserUpdateViewState extends State<UserUpdateView> {
  String profile = "";
  String initial = "";

  @override
  Widget build(BuildContext context) {

    clear() {}

    onSubmit() {}

    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(58.0),
          child: MyAppBar(
            title: 'Modifier les informations',
          ),
        ),
        drawer: const MyDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --------------------- Image ---------------------
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const MyBackgroundImage(
                        source: "assets/images/background/bg_2.webp",
                      ),
                      Stack(
                        children: [
                          profile != ""
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      boxShadow: [Tools.shadow02],
                                    ),
                                    child: CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: AssetImage(
                                        profile,
                                      ),
                                    ),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      boxShadow: [Tools.shadow02],
                                    ),
                                    width: 140,
                                    height: 140,
                                    child: Center(
                                      child: Text(
                                        initial,
                                        style: const TextStyle(
                                          color: Tools.color05,
                                          fontSize: Tools.fontSize03,
                                          fontWeight: Tools.fontWeight01,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          // const CircleAvatar(
                          //   radius: 70,
                          //   backgroundColor: Tools.color06,
                          //   backgroundImage: AssetImage(
                          //     'assets/images/icon/icon_user.png',
                          //   ),
                          // ),
                          Positioned(
                            bottom: 5,
                            right: 13,
                            child: InkWell(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      Tools.shadow01,
                                    ],
                                    color: Tools.color05,
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  child: const MyImagePicker(
                                    icon: Icons.photo_camera,
                                    iconColor: Tools.color09,
                                    iconSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // --------------------- Info perso ---------------------

                  // --------------------- Button ---------------------
                  Row(
                    children: [
                      Flexible(
                        child: MyButton(
                          title: 'Annuler',
                          action: clear,
                          textColor: Tools.color08,
                          backgroundColor: Colors.transparent,
                          borderColor: Tools.color08,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: MyButton(
                          title: 'Enregistrer',
                          action: onSubmit,
                          textColor: Tools.color05,
                          backgroundColor: Tools.color08,
                          borderColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
