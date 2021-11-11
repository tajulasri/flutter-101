import 'dart:convert' as convert;
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String API_ENDPOINT = "";

getAllTodos() async {
  var url = Uri.https('jsonplaceholder.typicode.com', '/todos');
  var response = await http.get(url);
  print(response.body);
}

Future<List<dynamic>> getAllAssets() async {
  var url = Uri.https('flutter.codexpert.my', '/api/assets');
  var response = await http.get(url);

  var data = convert.jsonDecode(response.body);
  return data;
}

Future<dynamic> getAsset(String id) async {
  var url = Uri.https('flutter.codexpert.my', "/api/assets/${id}");
  var response = await http.get(url);

  var data = convert.jsonDecode(response.body);
  return data['status'] == 200 ? data['data'] : [];
}

login(String username, String password) async {
  Uri url = Uri.https("flutter.codexpert.my", "/api/login");
  var response = await http.post(
    url,
    headers: {"content-type": "application/json"},
    body: convert.jsonEncode(
      {"email": username, "password": password},
    ),
  );

  return convert.jsonDecode(response.body);
}

storeToken(String token) async {
  SharedPreferences sharePreference = await SharedPreferences.getInstance();
  sharePreference.setString('token', token);
}

getToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? token = sharedPreferences.getString('token');
  return token;
}

Future<dynamic> checkToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? token = sharedPreferences.getString('token');
  return token;
}

bool isLoggedIn() {
  return getToken() == null ? false : true;
}
