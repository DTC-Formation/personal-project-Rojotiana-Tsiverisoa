import 'package:flutter/material.dart';

import 'package:tetiharana/utilities/tools.dart';
import 'package:tetiharana/widget/image/background_image.dart';
import 'package:tetiharana/widget/navigation/app_bar.dart';
import 'package:tetiharana/widget/navigation/drawer.dart';

class FamillyList extends StatefulWidget {
  const FamillyList({super.key});

  @override
  State<FamillyList> createState() => _FamillyListState();
}

class _FamillyListState extends State<FamillyList> {
  List<FamillyItem> famillyItem = [
    FamillyItem(
      image: "assets/images/familly/familly_1.jpg",
      famillyName: "Alexandre",
      child: 2,
      action: () => {},
    ),
    FamillyItem(
      image: "assets/images/familly/familly_2.webp",
      famillyName: "Léon",
      child: 4,
      action: () => {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(58.0),
          child: MyAppBar(
            title: 'Classement par famille',
          ),
        ),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --------------------- Image ---------------------
                const MyBackgroundImage(
                  source: "assets/images/familly/familly_3.jpg",
                ),
                const SizedBox(
                  height: 15,
                ),

                // --------------------- Family list ---------------------
                Column(
                  children: famillyItem,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FamillyItem extends StatefulWidget {
  final String image;
  final String famillyName;
  final int child;
  final void Function() action;

  const FamillyItem({
    super.key,
    required this.image,
    required this.famillyName,
    required this.child,
    required this.action,
  });

  @override
  State<FamillyItem> createState() => _FamillyItemState();
}

class _FamillyItemState extends State<FamillyItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: const Color.fromARGB(73, 0, 0, 0),
      child: ListTile(
        tileColor: Tools.color05,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Tools.radius01,
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: Tools.color06,
          backgroundImage: AssetImage(
            widget.image,
          ),
        ),
        title: Text(
          'Famille ${widget.famillyName}',
          style: const TextStyle(
            color: Tools.color02,
            fontWeight: Tools.fontWeight01,
          ),
        ),
        subtitle: Text(
          'Enfants: ${widget.child}',
          style: const TextStyle(
            color: Tools.color10,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: Tools.color10,
        ),
        onTap: widget.action,
      ),
    );
  }
}
