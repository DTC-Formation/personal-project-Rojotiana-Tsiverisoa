import 'package:flutter/material.dart';

import 'package:tetiharana/app/controller/familly_controller.dart';
import 'package:tetiharana/app/views/familly/familly_tree_view.dart';
import 'package:tetiharana/utilities/helper.dart';
import 'package:tetiharana/utilities/tools.dart';
import 'package:tetiharana/widget/dialog/dialog.dart';
import 'package:tetiharana/widget/image/background_image.dart';
import 'package:tetiharana/widget/navigation/app_bar.dart';
import 'package:tetiharana/widget/navigation/drawer.dart';

class FamillyListView extends StatefulWidget {
  const FamillyListView({super.key});

  @override
  State<FamillyListView> createState() => _FamillyListViewState();
}

class _FamillyListViewState extends State<FamillyListView> {
  MyDialog myDialog = MyDialog();
  Helper helper = Helper();
  bool isLoading = false;
  FamillyController famillyController = FamillyController();

// ********************** Load familly list **********************
  List<FamillyItem> famillyItem = [];

  loadFamillyList() async {
    setState(() {
      isLoading = true;
    });

    await famillyController.getFamillyList(
      onSuccess: onLoadSuccess,
      onError: onLoadFail,
    );
  }

  onLoadSuccess(List data) {
    setState(() {
      famillyItem = data.map((item) {
        String jsonData = item['children'] ?? '';

        int numberOfChild = famillyController.getChildNumber(
          data: jsonData,
        );

        return FamillyItem(
          initial: helper.getInitial(
            item['firstname'],
            item['lastname'],
          ),
          image: "${item['filename']}",
          famillyName: "${item['firstname']}",
          child: numberOfChild,
          action: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FamillyTreeView(
                  userInfo: [
                    {
                      "id": item['id'],
                      "firstname": item['firstname'],
                      "lastname": item['lastname'],
                      "image": item['filename'],
                    }
                  ],
                ),
              ),
            ),
          },
        );
      }).toList();

      isLoading = false;
    });

    if (famillyItem.isEmpty) {
      myDialog.showMyDialog(
        title: "Aucune donnée trouvée",
        description: "Il n'y a aucune donnée disponible pour le moment.",
        confirmAction: () => {Navigator.of(context).pop()},
        confirmTitle: "Ok",
        context: context,
      );
    }
  }

  onLoadFail(error) {
    debugPrint("Error loading familly list: $error");
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadFamillyList();
  }

// ***************** Ending to load familly list *****************
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
                  source: "assets/images/familly/familly_3.webp",
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
  final String initial;
  final String image;
  final String famillyName;
  final int child;
  final void Function() action;

  const FamillyItem({
    super.key,
    required this.initial,
    required this.image,
    required this.famillyName,
    required this.child,
    required this.action,
  });

  @override
  State<FamillyItem> createState() => _FamillyItemState();
}

class _FamillyItemState extends State<FamillyItem> {
  Helper helper = Helper();
  String filePath = "";

  @override
  Widget build(BuildContext context) {
    filePath = helper.getFilePath("profile");

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
        leading: widget.image != "null"
            ? CircleAvatar(
                backgroundColor: Tools.color17,
                backgroundImage: NetworkImage(
                  "$filePath/${widget.image}",
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: Container(
                  color: Tools.color17,
                  width: 40,
                  height: 40,
                  child: Center(
                    child: Text(
                      widget.initial,
                      style: const TextStyle(
                        color: Tools.color02,
                        fontSize: Tools.fontSize02,
                        fontWeight: Tools.fontWeight01,
                      ),
                    ),
                  ),
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
