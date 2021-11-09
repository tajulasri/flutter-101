import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  ListViewScreen({Key? key}) : super(key: key);

  List contacts = [
    {"name": "Shah", "mobile": "01344545657"},
    {"name": "Lan", "mobile": "01344542357"},
    {"name": "Rudy", "mobile": "01344523257"},
    {"name": "Naim", "mobile": "01344535357"},
    {"name": "Shahrul", "mobile": "01344535657"},
    {"name": "Ikhwan", "mobile": "01344542657"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        child: ListView.builder(
            itemBuilder: (context, index) => Container(
                  height: 200,
                  child: Text(
                    contacts[index]['mobile'],
                  ),
                ),
            itemCount: contacts.length),
      ),
    );
  }
}
