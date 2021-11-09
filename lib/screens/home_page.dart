import 'dart:ui';

import 'package:asset_kktm/screens/list_view.dart';
import 'package:asset_kktm/screens/login.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String pageTitle = "Home Page";

  _changePage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(
          arguments: "This is previous data from page.",
        ),
        builder: (context) => ListViewScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        centerTitle: true,
        elevation: 0,
        leading: const Icon(Icons.list),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Pending Request",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Total Assets",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 400,
              child: Image.network(
                  "https://images.unsplash.com/photo-1550355291-bbee04a92027?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGNhcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80"),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                child: const Text("Click me"),
                onPressed: _changePage,
              ),
            )
          ],
        ),
      ),
    );
  }
}
