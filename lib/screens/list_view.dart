import 'dart:convert';

import 'package:asset_kktm/providers/asset_state.dart';
import 'package:asset_kktm/providers/dashboard_provider.dart';
import 'package:asset_kktm/screens/add_contact.dart';
import 'package:asset_kktm/screens/login.dart';
import 'package:asset_kktm/services/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class ListViewScreen extends StatelessWidget {
  ListViewScreen({Key? key}) : super(key: key);

  //function to navigate to next screen
  _navigateToDetailScreen(context, contact) {
    Navigator.of(context).push(
      MaterialPageRoute(
        //dimana variable contact ni kepunyaan function _navigateToDetailScreen
        settings: RouteSettings(arguments: contact),
        builder: (context) => LoginScreen(),
      ),
    );
  }

  _navigateToAddContact(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddContactScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //call our state via provider
    context.read<AssetState>().getAssets();

    return FutureBuilder(
        future: getAllAssets(),
        initialData: [],
        builder: (context, AsyncSnapshot snapshot) {
          var _data = snapshot.data;

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () => _navigateToAddContact(context),
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            body: Container(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: Colors.blueGrey[200],
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => print(1),
                  child: Container(
                      color: Colors.transparent,
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
                                  _data['label'].toString(),
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  _data['label'].toString(),
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
                itemCount: _data.length,
              ),
            ),
          );
        });
  }
}
