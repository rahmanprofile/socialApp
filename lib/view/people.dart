import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/viewmodel/component/profiel_box.dart';
import 'package:social/viewmodel/component/search_box.dart';

class People extends StatefulWidget {
  const People({Key? key}) : super(key: key);

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchBox(
                title: 'Search',
                onTap: () {},
                icon: CupertinoIcons.search,
              ),
              const SizedBox(height: 8.0),
              ProfileBox(
                name: 'Sara',
                email: 'sara@gmail.com',
                onTap: () {},
                url:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4Uqq2Cbaj0p1063bM07KA4Vt1P2wBoFPy3Q&usqp=CAU',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
