import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social/model/services/fierbase_service.dart';
import '../viewmodel/component/my_information.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final services = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15.0),
              Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const CircleAvatar(
                      radius: 70.0,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjgzOoeWAe9w4YTYMye3LNwVWU2QVptuu07w&usqp=CAU'),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 10.0,
                      child: InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.cyan,
                          child: Icon(
                            CupertinoIcons.pen,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25.0),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          MyInformation(
                            keys: "Name : ",
                            values: "Sachin Prajapati",
                          ),
                          MyInformation(
                            keys: "Email : ",
                            values: "sachin@gmail.com",
                          ),
                          MyInformation(
                            keys: "Status : ",
                            values: "Information Technology",
                          ),
                          MyInformation(
                            keys: "Phone : ",
                            values: "+91 ******5684",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Alert!",
                                  style: GoogleFonts.lato(),
                                ),
                                content: Text(
                                  "Sure! are want to logout",
                                  style: GoogleFonts.lato(),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        setState(
                                          () {
                                            services.signOut(context);
                                          },
                                        );
                                      },
                                      child: Text(
                                        "Yes",
                                        style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "No",
                                        style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.0),
                          color: Colors.red,
                        ),
                        child: const Center(
                          child: Icon(
                            CupertinoIcons.arrow_up_circle_fill,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
