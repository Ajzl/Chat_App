import 'package:chatapp/screens/home_screen/home_screen.dart';
import 'package:chatapp/screens/login/login_screen.dart';
import 'package:chatapp/screens/provider/login_provider.dart';
import 'package:chatapp/utils/sharedpref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? isLogged = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<Login_Provider>(
        create: (context) => Login_Provider()),
  ], child: const ChatApp()));
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLogged! ? Home_Screen() : Login_Screen(),
    );
  }
}
