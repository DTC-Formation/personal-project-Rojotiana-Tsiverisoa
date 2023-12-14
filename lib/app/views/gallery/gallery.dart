import 'package:flutter/material.dart';
import 'package:tetiharana/utilities/tools.dart';

import 'package:tetiharana/widget/navigation/app_bar.dart';
import 'package:tetiharana/widget/navigation/drawer.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<GalleryItem> galleryItem = [
    GalleryItem(
      source: "assets/images/familly/familly_1.jpg",
      action: () => {},
    ),
    GalleryItem(
      source: "assets/images/familly/familly_2.webp",
      action: () => {},
    ),
    GalleryItem(
      source: "assets/images/familly/familly_3.jpg",
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
            title: 'Gallerie',
          ),
        ),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --------------------- Gallery ---------------------
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.15,
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    children: galleryItem,
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

class GalleryItem extends StatefulWidget {
  final String source;
  final void Function() action;

  const GalleryItem({
    super.key,
    required this.source,
    required this.action,
  });

  @override
  State<GalleryItem> createState() => _GalleryItemState();
}

class _GalleryItemState extends State<GalleryItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.action,
      borderRadius: BorderRadius.circular(Tools.radius01),
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/icon/icon_image.png',
            ),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(122, 158, 158, 158),
            ),
            BoxShadow(
              color: Tools.color05,
              spreadRadius: -1.0,
              blurRadius: 12.0,
            ),
          ],
          borderRadius: BorderRadius.circular(
            Tools.radius01,
          ),
        ),
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Tools.radius01),
          child: Image.asset(
            widget.source,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
