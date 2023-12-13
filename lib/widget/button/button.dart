import 'package:flutter/material.dart';

import 'package:tetiharana/utilities/tools.dart';

class MyButton extends StatefulWidget {
  final void Function() action;
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;

  const MyButton({
    super.key,
    required this.title,
    required this.action,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 30,
      ),
      child: SizedBox(
        width: size.width,
        height: 50,
        child: InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: widget.action,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: widget.backgroundColor,
              border: Border.all(
                width: 2,
                color: widget.borderColor,
              ),
            ),
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: Tools.fontSize02,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
