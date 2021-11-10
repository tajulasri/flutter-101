import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

const String API_ENDPOINT = "";

getAllTodos() async {
  var url = Uri.https('jsonplaceholder.typicode.com', '/todos');
  var response = await http.get(url);
  print(response.body);
}

getAllAssets() async {
  var url = Uri.https('flutter.codexpert.my', '/api/assets');
  var response = await http.get(url);

  var data = convert.jsonDecode(response.body);
  return data;
}

getAsset(String id) async {
  var url = Uri.https('flutter.codexpert.my', "/api/assets/${id}");
  var response = await http.get(url);

  var data = convert.jsonDecode(response.body);
  return data['status'] == 200 ? data['data'] : [];
}
