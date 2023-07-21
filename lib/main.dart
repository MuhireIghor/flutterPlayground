import 'package:flutter/material.dart';


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
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
        title:
        Text('Login',style: TextStyle(
        color: Colors.white,
        fontSize: 20
    ),),

    ),
        body: Container(
          padding: new EdgeInsets.symmetric(vertical: 20.0,horizontal: 40),
          width: double.infinity,
          height: double.infinity,
          child:ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration:InputDecoration(
                  hintText: 'muhireighor123@gmail.com',
                  labelText: 'E-mail Address'
                )

              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Muhire Ighor',
                  labelText: 'User Name'
                ),
              )
            ],
          ),
        ),
    ));
  }
}


