import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/viewmodel/component/profiel_box.dart';

import '../viewmodel/component/search_box.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              SearchBox(
                title: 'Search',
                onTap: () {},
                icon: CupertinoIcons.search,
              ),
              ProfileBox(
                name: "Sunaina",
                email: 'sunaina@gmail.com',
                onTap: () {},
                url:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4Uqq2Cbaj0p1063bM07KA4Vt1P2wBoFPy3Q&usqp=CAU',
              ),
              ProfileBox(
                name: "Puja Agrahari",
                email: 'puja@gmail.com',
                onTap: () {},
                url:
                    'https://www.tensionends.com/wp-content/uploads/2022/09/Profile-Pictures-Hd-Beautiful-Girls-40.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
