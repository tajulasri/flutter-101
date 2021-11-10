//
// Our dashboard state provider
//

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DashboardProvider with ChangeNotifier {
  //initiate private variable @ property untuk our state
  int _totalAssetCount = 0;
  //we exposing our property state by declaring
  //getters for private access _totalAssetCount
  int get totalAssetCount => _totalAssetCount;

  //untuk screen listview
  List<dynamic> _contacts = [
    // {"name": "Shah", "mobile": "01344545657", "type": "Work"},
    // {"name": "Lan", "mobile": "01344542357", "type": "Work"},
    // {"name": "Rudy", "mobile": "01344523257", "type": "Work"},
    // {"name": "Naim", "mobile": "01344535357", "type": "Work"},
    // {"name": "Shahrul", "mobile": "01344535657", "type": "Work"},
    // {"name": "Ikhwan", "mobile": "01344542657", "type": "Work"},
  ];

  List<dynamic> get contacts => _contacts;

  //crud
  addContact(String name, String mobile) {
    _contacts.add(
      {"name": name, "mobile": mobile, "type": "work"},
    );

    notifyListeners();
  }

  //method to simulate our change notifier
  //and implementing how provider works
  incrementCounter() {
    _totalAssetCount++;
    notifyListeners();
  }
}
