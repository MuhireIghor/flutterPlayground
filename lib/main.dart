import 'package:flutter/material.dart';
import 'package:password_validated_field/password_validated_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _FormData {
  String email = '';
  String password = '';
  String userName = '';
}

class _MyAppState extends State<MyApp> {
  String _validateName(String value){
    if (value.length<8){
      return 'Username must be greater then 8';

    }

      return 'ok';

  }
  String _validateEmail(String value){
    if(!value.endsWith('@gmail.com')){
      return 'This is not a valid Email';
    }
    return 'ok';
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  _FormData data = _FormData();

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          body: Container(
              padding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 50),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      validator: _validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'muhireighor123@gmail.com',
                          labelText: 'E-mail Address'),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: 'Muhire Ighor', labelText: 'User Name'),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: PasswordValidatedFields(
                        inputDecoration: InputDecoration(
                          filled: true,
                          labelText: 'Password',
                          fillColor: Colors.white
                        ),
                      ),
                    ),
                    Container(
                        child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        child: Text('Login'),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          padding: EdgeInsets.all(20),
                        ),
                      ),
                    ))
                  ],
                ),
              )),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: 'Settings')
            ],
            onTap: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ));
  }
}
