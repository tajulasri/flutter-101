import 'package:asset_kktm/providers/auth_state.dart';
import 'package:asset_kktm/screens/home_page.dart';
import 'package:asset_kktm/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/src/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkToken(),
        initialData: null,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Scaffold(
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
                            onPressed: () async {
                              var result = await login(
                                _usernameController.text,
                                _passwordController.text,
                              );

                              print(result['access_token']);

                              if (result.containsKey('access_token')) {
                                storeToken(result['access_token']);
                                if (isLoggedIn()) {
                                  context.read<AuthState>().successLogin();

                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => HomePageScreen(),
                                      ),
                                      (route) => false);
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text("Wrong username or password."),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                            child: Text("Login"),
                          ),
                        )
                      ],
                    ),
                  )),
                )
              : HomePageScreen();
        });
  }
}
