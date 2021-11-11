import 'package:asset_kktm/providers/auth_state.dart';
import 'package:asset_kktm/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/src/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20.0),
        width: double.infinity,
        margin: EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120,
              child: Image.network(
                  'https://www.tvetmara.edu.my/images/Korporat/logo-kktm.jpg'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "KKTM KEMAMAN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            TextFormField(
              autocorrect: false,
              obscureText: false,
              controller: _usernameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
                labelText: "Name",
              ),
              maxLines: 1,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              controller: _passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                ),
                labelText: "Name",
              ),
              maxLines: 1,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.read<AuthState>().login(
                      _usernameController.text,
                      _passwordController.text,
                    ),
                child: Text("Login"),
              ),
            )
          ],
        ),
      )),
    );
  }
}
