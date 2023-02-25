import 'package:flutter/material.dart';

class BoxInput extends StatelessWidget {
  final String title;
  final IconData icon;
  final TextEditingController controller;
  const BoxInput({
    Key? key,
    required this.title,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15.0)),
        filled: true,
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Colors.blueGrey)),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Colors.blueGrey)),
        //fillColor: Colors.yellow,
      ),
    );
  }
}
