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

  //method to simulate our change notifier
  //and implementing how provider works
  incrementCounter() {
    _totalAssetCount++;
    notifyListeners();
  }
}
