import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mbti_profile/Homepage.dart';
import 'package:mbti_profile/login_page.dart';
import 'package:mbti_profile/profile_page.dart';
import 'package:mbti_profile/user_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(create: (context) => ProfileService()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}


// 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