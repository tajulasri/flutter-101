import 'package:asset_kktm/providers/asset_state.dart';
import 'package:asset_kktm/providers/dashboard_provider.dart';
import 'package:asset_kktm/screens/add_contact.dart';
import 'package:asset_kktm/screens/loading.dart';
import 'package:asset_kktm/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class ListViewScreen extends StatelessWidget {
  ListViewScreen({Key? key}) : super(key: key);

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

    return context.watch<AssetState>().loading
        ? const LoadingScreen()
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () => context.read<AssetState>().refresh(),
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
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Message"),
                                  content: Text(
                                    "Are you sure to remove this contact?",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("No"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context
                                            .read<DashboardProvider>()
                                            .removeContact(index);

                                        Navigator.pop(context);

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            duration: Duration(seconds: 3),
                                            backgroundColor: Colors.green,
                                            content: Text(
                                              "Contact removed",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text("Yes"),
                                    )
                                  ],
                                );
                              });
                          //context.read<DashboardProvider>().removeContact(index);
                        },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        context
                                            .watch<AssetState>()
                                            .assets[index]['label']
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Flexible(
                                        child: Text(
                                          context
                                                  .watch<AssetState>()
                                                  .assets[index]
                                                      ['expiry_in_days']
                                                  .toString() +
                                              " days",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.normal,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                  itemCount: context.watch<AssetState>().assets.length),
            ),
          );
  }
}
