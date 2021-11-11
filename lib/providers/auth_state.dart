import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthState with ChangeNotifier {
  bool _isAuthenticated = false;
  bool _loading = true;

  bool get isAuthenticated => _isAuthenticated;
  bool get loading => _loading;

  successLogin() {
    _isAuthenticated = true;
    notifyListeners();
  }
}
