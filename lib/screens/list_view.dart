import 'package:asset_kktm/screens/login.dart';
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

  //function to navigate to next screen
  _navigateToDetailScreen(context, contact) {
    Navigator.of(context).push(
      MaterialPageRoute(
        settings: RouteSettings(arguments: contact),
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  color: Colors.blueGrey[200],
                ),
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () => _navigateToDetailScreen(
                    context,
                    contacts[index]['name'],
                  ),
                  child: Container(
                      height: 60,
                      margin: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.blueGrey[500],
                                size: 30,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contacts[index]['name'],
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  contacts[index]['mobile'],
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
            itemCount: contacts.length),
      ),
    );
  }
}
