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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int currentIndex=0;
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
              margin: EdgeInsets.symmetric(vertical: 90),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'muhireighor123@gmail.com',
                          labelText: 'E-mail Address'),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child:TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: 'Muhire Ighor', labelText: 'User Name'),
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: 'your password',
                          labelText: 'Password'
                        ),
                      ),
                    ),

                    Container(

                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 60),
                       child: ElevatedButton(

                          child: Text('Login'),
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(

                            onPrimary: Colors.white,
                            padding: EdgeInsets.all(20),



                          ),
                        ),
                        
                      )

                    )

                  ],

                ),
              )),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:currentIndex ,
            items: [
              BottomNavigationBarItem(icon:Icon(
                Icons.home
              ),
              label: 'Home'),
              BottomNavigationBarItem(icon:Icon(
                Icons.settings,
              ),
              label: 'Settings')
            ],
            onTap: (int index){
              setState(() {
                currentIndex=index;
              });
            },
          ),
        ));
  }
}
