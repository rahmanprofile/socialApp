import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social/view/profile.dart';
import 'chat.dart';
import 'create.dart';
import 'home_page.dart';
import 'people.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  static const List<Widget> _optionWidget = [
    HomePage(),
    Chats(),
    CreateNew(),
    People(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              child: Center(
                  child: Icon(
                CupertinoIcons.person_fill,
                color: Colors.blueGrey,
              )),
            ),
            Container(
              height: 40.0,
              width: MediaQuery.of(context).size.width * 0.65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Search here",
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      size: 22,
                    )),
              ),
            ),
            InkWell(
              onTap: () => {},
              child: const Icon(
                CupertinoIcons.bell_circle,
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
      body: _optionWidget.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[600],
        selectedLabelStyle:
            GoogleFonts.ptSans(fontSize: 12.0, fontWeight: FontWeight.w500),
        unselectedLabelStyle:
            GoogleFonts.ptSans(fontSize: 12.0, fontWeight: FontWeight.w500),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bubble_left), label: "Chats"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.add), label: "Create"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_2_fill), label: "People"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_fill), label: "Profile"),
        ],
      ),
    );
  }
}
