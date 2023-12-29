import 'package:flutter/material.dart';

import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

import 'package:tetiharana/utilities/tools.dart';

class MyExpansionPanel extends StatefulWidget {
  final String title;
  final List<Widget> children;

  const MyExpansionPanel({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  State<MyExpansionPanel> createState() => _MyExpansionPanelState();
}

class _MyExpansionPanelState extends State<MyExpansionPanel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedExpansionTile(
          title: Text(
            widget.title,
            style: const TextStyle(
              color: Tools.color06,
              fontWeight: Tools.fontWeight01,
            ),
          ),
          duration: Durations.medium1,
          childrenPadding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          tileColor: Colors.white,
          hoverColor: Colors.transparent,
          trailing: const Icon(
            Icons.expand_more_rounded,
            color: Tools.color06,
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color.fromARGB(141, 158, 158, 158),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          children: widget.children,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}