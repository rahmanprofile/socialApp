import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const SearchBox({
    Key? key,
    required this.title,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.0), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: title,
                border: InputBorder.none,
                prefixIcon: Icon(icon),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
