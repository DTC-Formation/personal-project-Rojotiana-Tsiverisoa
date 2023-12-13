import 'package:flutter/material.dart';

import 'package:tetiharana/utilities/tools.dart';

class MyTextInput extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final TextEditingController? inputController;

  const MyTextInput({
    super.key,
    required this.labelText,
    required this.icon,
    this.inputController,
  });

  @override
  State<MyTextInput> createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.inputController,
      cursorColor: Tools.color10,
      decoration: InputDecoration(
        suffixIcon: Transform.translate(
          offset: const Offset(14, 6),
          child: Icon(
            widget.icon,
            color: Tools.color09,
          ),
        ),
        labelText: widget.labelText,
        floatingLabelStyle: const TextStyle(
          color: Tools.color09,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Tools.color10,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Tools.color10,
          ),
        ),
      ),
      style: const TextStyle(
        color: Tools.color10,
      ),
    );
  }
}
