import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rafiki_bot/pages/home.dart';
import 'package:rafiki_bot/pages/landingPage.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LandingPage(),
    );
  }
}


