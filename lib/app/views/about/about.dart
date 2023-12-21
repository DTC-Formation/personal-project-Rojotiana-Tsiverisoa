import 'package:flutter/material.dart';

import 'package:tetiharana/widget/navigation/app_bar.dart';
import 'package:tetiharana/widget/navigation/drawer.dart';
import 'package:tetiharana/utilities/tools.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                // const Card(
                //   // color: Tools.color05,
                //   elevation: 10,
                //   shadowColor: Color.fromARGB(73, 0, 0, 0),
                //   child: Column(
                //     children: [
                //       ListTile(
                //         tileColor: Tools.color05,
                //         leading: CircleAvatar(
                //           backgroundColor: Tools.color08,
                //           backgroundImage: AssetImage(
                //             "assets/images/icon/icon.png",
                //           ),
                //         ),
                //         title: Text(
                //           'Tetiharana',
                //           style: TextStyle(
                //             color: Tools.color02,
                //             fontWeight: Tools.fontWeight01,
                //             fontSize: Tools.fontSize01,
                //           ),
                //         ),
                //       ),
                //       ListTile(
                //         tileColor: Tools.color05,
                //         leading: Icon(
                //           Icons.info,
                //           color: Tools.color09,
                //         ),
                //         title: Text(
                //           'Version',
                //           style: TextStyle(
                //             color: Tools.color02,
                //             fontWeight: Tools.fontWeight01,
                //           ),
                //         ),
                //         subtitle: Text(
                //           '4.2',
                //           style: TextStyle(
                //             color: Tools.color09,
                //             fontSize: 12,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Card(
                  elevation: 10,
                  shadowColor: const Color.fromARGB(73, 0, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Container(
                              color: Colors.red,
                              // width: size.width,
                              width: 40,
                              height: 40,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Container(
                              color: Colors.yellow,
                              // width: size.width,
                              height: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
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
