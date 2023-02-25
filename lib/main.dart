import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social/model/chatroom_model.dart';
import 'package:social/model/services/fierbase_service.dart';
import 'package:social/model/message.dart';
import 'package:social/model/user_model.dart';
import 'package:social/view/home.dart';
import 'package:social/viewmodel/authentication/signin.dart';
import 'package:social/viewmodel/component/notify.dart';
import 'model/post_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance.authStateChanges().listen((User? currentUser) {
    if (currentUser == null) {
      runApp(const RouteApp());
    } else {
      runApp(const MyApp());
    }
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final system = SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey[600],
      systemNavigationBarColor: Colors.blueGrey[600]);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(system);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseService()),
        ChangeNotifierProvider(create: (_) => PostModel()),
        ChangeNotifierProvider(create: (_) => Notify()),
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => ChatroomModel()),
        ChangeNotifierProvider(create: (_) => Message()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[200],
          focusColor: Colors.blueGrey[600],
          //backgroundColor: Colors.grey[200],
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blueGrey[600],
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
            actionsIconTheme: const IconThemeData(color: Colors.white),
            titleTextStyle:
                GoogleFonts.ptSans(fontSize: 20, fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
        home: const Home(),
      ),
    );
  }
}

class RouteApp extends StatelessWidget {
  const RouteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        focusColor: Colors.blueGrey[600],
        //backgroundColor: Colors.grey[200],
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[600],
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          actionsIconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle:
              GoogleFonts.ptSans(fontSize: 20, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
      ),
      home: const SignIn(),
    );
  }
}
