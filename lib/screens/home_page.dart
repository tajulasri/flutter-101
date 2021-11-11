import 'dart:ui';

import 'package:asset_kktm/providers/auth_state.dart';
import 'package:asset_kktm/providers/dashboard_provider.dart';
import 'package:asset_kktm/screens/add_contact.dart';
import 'package:asset_kktm/screens/dashboard.dart';
import 'package:asset_kktm/screens/list_view.dart';
import 'package:asset_kktm/screens/loading.dart';
import 'package:asset_kktm/screens/login.dart';
import 'package:asset_kktm/screens/scan_asset.dart';
import 'package:asset_kktm/services/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String pageTitle = "Home Page";
  int currentIndex = 0;
  bool isReady = true;

  var profile = null;

  List<Widget> screens = [
    DashBoardScreen(),
    ListViewScreen(),
    AddContactScreen(),
    AddContactScreen(),
  ];

  //init state akan trigger waktu widget sedang di build.
  @override
  void initState() {
    var _profile = getProfile();
    setState(() {
      profile = _profile;
    });
  }

  _changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkToken(),
        initialData: null,
        builder: (context, snapshot) {
          return snapshot.data != null
              ? Scaffold(
                  appBar: AppBar(
                    title: FutureBuilder(
                        future: getProfile(),
                        initialData: null,
                        builder: (context, AsyncSnapshot snapshot) {
                          return snapshot.data == null
                              ? Text("Loading...")
                              : Text(snapshot.data['name'].toString());
                        }),
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
                )
              : LoginScreen();
        });
  }
}
