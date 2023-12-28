import 'package:flutter/material.dart';

import 'package:tetiharana/utilities/constants.dart';
import 'package:tetiharana/widget/navigation/app_bar.dart';
import 'package:tetiharana/widget/navigation/drawer.dart';
import 'package:tetiharana/utilities/tools.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  String appVersion = "${Constant.appVersion}";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(58.0),
          child: MyAppBar(
            title: 'A propos',
          ),
        ),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ***************** About App *****************
                Container(
                  decoration: BoxDecoration(
                    color: Tools.color05,
                    boxShadow: const [
                      Tools.shadow01,
                    ],
                    borderRadius: BorderRadius.circular(
                      Tools.radius01,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: Image.asset(
                                  "assets/images/icon/icon.png",
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tetiharana",
                                    style: TextStyle(
                                      fontSize: Tools.fontSize02,
                                      fontWeight: Tools.fontWeight01,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: Icon(
                                  Icons.info_rounded,
                                  color: Tools.color14,
                                  size: 26,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Version",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    appVersion,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Tools.color14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () => {},
                          child: const Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Icon(
                                    Icons.cached_rounded,
                                    color: Tools.color14,
                                    size: 26,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Historique",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: Icon(
                                  Icons.book_rounded,
                                  color: Tools.color14,
                                  size: 26,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Licence",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Gratuit",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Tools.color14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                // ***************** Author *****************
                Container(
                  decoration: BoxDecoration(
                    color: Tools.color05,
                    boxShadow: const [
                      Tools.shadow01,
                    ],
                    borderRadius: BorderRadius.circular(
                      Tools.radius01,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Auteur",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () => {},
                          child: const Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Icon(
                                    Icons.person,
                                    color: Tools.color14,
                                    size: 26,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rojotiana RAKOTOVOLOLONA",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => {},
                          child: const Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Icon(
                                    Icons.share_rounded,
                                    color: Tools.color14,
                                    size: 26,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Partager l'application",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
