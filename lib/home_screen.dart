import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome'),
            Container(
                child: Column(children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                icon: Icon(
                  Icons.account_box,
                ),
              ),
              Text('Login')
            ]))
          ],
        )
      ]),
      body: Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Image.asset('images/flatHouse.jpg')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu')
        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
      ),
    );
  }
}
