import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/model/services/fierbase_service.dart';
import 'package:social/viewmodel/authentication/signin.dart';
import '../component/box_input.dart';
import '../component/round_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final services = FirebaseService();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "SignUp",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400),
            ),
            const Text(
              "Personal details is required",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal),
            ),
            const Text(
              "Please register your details in social",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal),
            ),
            //const SizedBox(height: 0.0),
            const SizedBox(height: 30.0),
            BoxInput(
              title: "Enter name",
              icon: CupertinoIcons.person,
              controller: _nameController,
            ),
            const SizedBox(height: 10.0),
            BoxInput(
              title: "Enter email",
              icon: CupertinoIcons.mail,
              controller: _emailController,
            ),
            const SizedBox(height: 10.0),
            BoxInput(
              title: "Enter password",
              icon: CupertinoIcons.shield_fill,
              controller: _passwordController,
            ),
            const SizedBox(height: 30.0),
            RoundButton(
                title: 'SignIn',
                color: Colors.blueGrey[600]!,
                onTap: () {
                  setState(() {
                    services.signUp(
                      context,
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                      _nameController.text.trim(),
                    );
                  });
                }),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.blueGrey[600],
                      fontSize: 16),
                ),
                InkWell(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignIn()))
                  },
                  child: Text(
                    "SignIn",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[600],
                        fontSize: 16),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
