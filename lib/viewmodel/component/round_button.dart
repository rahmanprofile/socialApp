import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;
  const RoundButton(
      {Key? key, required this.title, required this.color, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), color: color),
        child: Center(
          child: Text(
            title,style:const TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),
          ),
        ),
      ),
    );
  }
}
