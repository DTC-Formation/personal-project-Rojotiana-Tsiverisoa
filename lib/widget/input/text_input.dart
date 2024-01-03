import 'package:flutter/material.dart';

import 'package:tetiharana/utilities/tools.dart';

class MyTextInput extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final TextEditingController? inputController;
  final bool required;

  const MyTextInput({
    super.key,
    required this.labelText,
    required this.icon,
    this.inputController,
    this.required = false,
  });

  @override
  State<MyTextInput> createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.inputController,
      cursorColor: Tools.color10,
      decoration: InputDecoration(
        suffixIcon: Transform.translate(
          offset: const Offset(10, 6),
          child: Icon(
            widget.icon,
            color: Tools.color09,
          ),
        ),
        labelText: widget.labelText + (widget.required ? ' *' : ''),
        floatingLabelStyle: const TextStyle(
          color: Tools.color09,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Tools.color09,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Tools.color09,
          ),
        ),
      ),
      style: const TextStyle(
        color: Tools.color10,
      ),
      validator: (value) {
        if (widget.required && (value == null || value.isEmpty)) {
          return 'Ce champ est requis';
        }
        return null; // Return null if validation succeeds
      },
    );
  }
}
