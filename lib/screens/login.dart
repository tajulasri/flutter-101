import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //get arguments from previous route action
    var routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("login Screen"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text(routeArguments['name'].toString()),
      ),
    );
  }
}
