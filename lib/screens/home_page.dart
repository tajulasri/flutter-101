import 'dart:ui';

import 'package:asset_kktm/screens/add_contact.dart';
import 'package:asset_kktm/screens/dashboard.dart';
import 'package:asset_kktm/screens/list_view.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String pageTitle = "Home Page";
  int currentIndex = 0;

  List<Widget> screens = [
    DashBoardScreen(),
    ListViewScreen(),
    AddContactScreen(),
    AddContactScreen(),
  ];

  _changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              print("This is more button");
            },
            icon: const Icon(
              Icons.more_vert_outlined,
            ),
          )
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => _changeIndex(index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_outlined),
              label: "Assets",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: "Scan",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: "Account"),
          ]),
    );
  }
}
