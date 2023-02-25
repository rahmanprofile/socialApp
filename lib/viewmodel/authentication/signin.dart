import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/model/services/fierbase_service.dart';
import 'package:social/viewmodel/authentication/signup.dart';
import '../component/box_input.dart';
import '../component/round_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
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
              "SignIn",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400),
            ),
            const Text(
              "Authentication is required",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal),
            ),
            const Text(
              "Please verify your account in social",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal),
            ),
            //const SizedBox(height: 0.0),

            const SizedBox(height: 30.0),
            BoxInput(
              title: "Enter email",
              icon: CupertinoIcons.mail,
              controller: _emailController,
            ),
            const SizedBox(height: 20.0),
            BoxInput(
              title: "Enter password",
              icon: CupertinoIcons.shield_fill,
              controller: _passwordController,
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: ()=>{},
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[600],
                        fontSize: 16),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0),
            RoundButton(
                title: 'SignIn',
                color: Colors.blueGrey[600]!,
                onTap: () {
                  setState(() {
                    services.signIn(context,
                      _emailController.text.trim(),
                      _passwordController.text.trim()
                    );
                  });
                }
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.blueGrey[600],
                      fontSize: 16),
                ),
                InkWell(
                  onTap: ()=>{
                    Navigator.push( context,
                      MaterialPageRoute(builder: (context) => const SignUp(),),)
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[600],
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
