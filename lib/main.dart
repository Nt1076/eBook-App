import 'package:ebook_app/config/theme.dart';
import 'package:ebook_app/firebase_options.dart';
import 'package:ebook_app/pages/homePage/homepage.dart';
import 'package:ebook_app/pages/splashScreen/splashScreen.dart';
import 'package:ebook_app/pages/welcomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:
  DefaultFirebaseOptions.currentPlatform,
   );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Book',
      theme: lightTheme,
      home:const SplacePage(),
    );
  }
}

