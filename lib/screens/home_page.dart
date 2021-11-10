import 'dart:ui';

import 'package:asset_kktm/providers/dashboard_provider.dart';
import 'package:asset_kktm/screens/add_contact.dart';
import 'package:asset_kktm/screens/dashboard.dart';
import 'package:asset_kktm/screens/list_view.dart';
import 'package:asset_kktm/services/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String pageTitle = "Home Page";
  int currentIndex = 0;
  bool isReady = true;

  List<Widget> screens = [
    DashBoardScreen(),
    ListViewScreen(),
    AddContactScreen(),
    AddContactScreen(),
  ];

  //init state akan trigger waktu widget sedang di build.
  @override
  void initState() {
    getAllTodos();
  }

  _changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isReady
        ? Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "State  ${context.watch<DashboardProvider>().totalAssetCount.toString()}",
              ),
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
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
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
