import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

const String API_ENDPOINT = "";

getAllTodos() async {
  var url = Uri.https('jsonplaceholder.typicode.com', '/todos');
  var response = await http.get(url);
  print(response.body);
}
