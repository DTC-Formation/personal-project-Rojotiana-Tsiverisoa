import 'package:flutter/material.dart';

import 'package:tetiharana/utilities/tools.dart';

class MyAppBar extends StatefulWidget {
  final String title;
  const MyAppBar({super.key, required this.title});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: AppBar(
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(
          color: Tools.color07,
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Tools.color07,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Tools.color07,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
