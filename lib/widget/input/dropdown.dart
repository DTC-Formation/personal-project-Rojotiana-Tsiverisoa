import 'package:flutter/material.dart';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:tetiharana/utilities/tools.dart';

class MyDropdown extends StatefulWidget {
  final String? hintText;
  final List<DropdownItem> items;
  final void Function(String)? onChanged;
  final String? controller;

  const MyDropdown({
    super.key,
    this.hintText,
    required this.items,
    this.onChanged,
    this.controller,
  });

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  DropdownItem? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Stack(
        children: [
          widget.controller != ""
              ? Text(
                  "${widget.hintText}",
                  style: const TextStyle(
                    fontSize: 13,
                    color: Tools.color09,
                  ),
                )
              : Text(
                  "${widget.hintText}",
                  style: const TextStyle(
                    fontSize: 0,
                    color: Tools.color09,
                  ),
                ),
          CustomDropdown<DropdownItem>(
            hintText: widget.hintText,
            items: widget.items,
            excludeSelected: false,
            onChanged: (DropdownItem? selectedItem) {
              setState(() {
                _selectedItem = selectedItem;
                if (widget.onChanged != null) {
                  widget.onChanged!(_selectedItem!.value);
                }
              });
            },
            closedFillColor: Colors.transparent,
            closedBorderRadius: BorderRadius.zero,
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                  // left: 15,
                  // right: 15,
                  ),
              child: Container(
                padding: EdgeInsets.zero,
                height: 5,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Tools.color09,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownItem {
  final String list;
  final String value;

  DropdownItem({
    required this.list,
    required this.value,
  });

  @override
  String toString() {
    return list;
  }
}
