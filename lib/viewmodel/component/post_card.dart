import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCard extends StatelessWidget {
  String title;
  String body;
  String bio;

  PostCard({Key? key,
    required this.body,
    required this.title,
    required this.bio,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding:const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title,style: GoogleFonts.lato(color: Colors.black),),
            Text(body,style: GoogleFonts.lato(color: Colors.black),),
            Text(bio,style: GoogleFonts.lato(color: Colors.black),),
          ],
        ),
      ),
    );
  }
}
