import 'package:flutter/material.dart';
import 'package:news/screens/SplashScreen/splash_screen.dart';
import 'package:news/screens/homepage/homepage.dart';

import 'package:news/screens/homescreeen.dart';
import 'package:news/screens/persistenttab/bottomnavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

