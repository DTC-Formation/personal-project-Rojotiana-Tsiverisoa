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
    const GalleryItem(
      source: "assets/images/familly/familly_1.jpg",
      name: "Nom",
    ),
    const GalleryItem(
      source: "assets/images/familly/familly_2.webp",
      name: "Nom",
    ),
    const GalleryItem(
      source: "assets/images/familly/familly_3.jpg",
      name: "Nom",
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
  final String name;

  const GalleryItem({
    super.key,
    required this.source,
    required this.name,
  });

  @override
  State<GalleryItem> createState() => _GalleryItemState();
}

class _GalleryItemState extends State<GalleryItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Tools.radius01,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close_rounded,
                      color: Tools.color02,
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      Tools.radius01,
                    ),
                    child: Image.asset(
                      widget.source,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 8,
                  ),
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                      color: Tools.color07,
                      fontWeight: Tools.fontWeight01,
                      fontSize: Tools.fontSize02,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
