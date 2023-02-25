import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileBox extends StatelessWidget {
  final String email;
  final String name;
  final String url;
  final VoidCallback onTap;

  const ProfileBox(
      {Key? key,
      required this.name,
      required this.email,
      required this.onTap,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        padding: const EdgeInsets.all(2.0),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.0), color: Colors.white),
        child: Center(
          child: ListTile(
            onTap: onTap,
            leading: CircleAvatar(
              //backgroundColor: Colors.grey[400],
              backgroundImage: NetworkImage(url),
              radius: 30.0,
            ),
            trailing: const Icon(CupertinoIcons.chevron_forward, size: 20),
            subtitle: Text(
              email,
              style: GoogleFonts.lato(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            ),
            title: Text(
              name,
              style:
                  GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
