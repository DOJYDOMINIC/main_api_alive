import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({
    Key? key,
    required this.hint,
    required this.controller,
    this.hintvalue,
    required this.onchanged,
    this.keytype,
  }) : super(key: key);
  final String hint;
  final String? hintvalue;
  final TextEditingController controller;
  final ValueChanged onchanged;
  final TextInputType? keytype;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        onChanged: onchanged,
        keyboardType: keytype,
        controller: controller,
        decoration: InputDecoration(
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black)),
          labelText: '${hint}',
          labelStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
