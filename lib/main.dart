import 'package:flutter/material.dart';
import 'package:jobs/login_screen.dart';
import 'package:jobs/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      routes: {
        '/':(context)=>HomePage(),
        '/login':(context)=>LoginPage(),
      },
        debugShowCheckedModeBanner: false,
      initialRoute: '/',
    );
  }
}
