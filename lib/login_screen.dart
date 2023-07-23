import 'package:flutter/material.dart';
import 'package:password_validated_field/password_validated_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _FormData {
  String email = '';
  String password = '';
  String userName = '';
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  _FormData data = _FormData();

  int currentIndex = 0;
  String _validateName(String value) {
    if (value.length < 8) {
      return 'Username must be greater then 8';
    }

    return '';
  }

  bool isValidEmail(String email) {
    final emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  void submit() {
    if (this._formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20)),
          padding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    width: double.infinity,
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter an email!';
                        } else if (!isValidEmail(value)) {
                          return 'Invalid email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        this.data.email = value!;
                      },
                      decoration: InputDecoration(
                          hintText: 'muhireighor123@gmail.com',
                          labelText: 'E-mail Address'),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  width: double.infinity,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a user name!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      this.data.userName = value!;
                    },
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
                        fillColor: Colors.white),
                  ),
                ),
                Container(
                    child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    child: Text('Login'),
                    onPressed: this.submit,
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
              label: 'Settings'),

        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
