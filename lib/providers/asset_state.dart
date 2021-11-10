import 'package:asset_kktm/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AssetState with ChangeNotifier {
  int _totalAssets = 0;
  List<dynamic> _assets = [];
  Map<dynamic, dynamic> _asset = {};
  bool _loading = false;

  List<dynamic> get assets => _assets;
  Map<dynamic, dynamic> get asset => _asset;
  bool get loading => _loading;
  int get totalAsstes => _totalAssets;

  getAssets() {
    _loading = true;

    getAllAssets().then((data) {
      //finish request
      _loading = false;
      print(data.length);
      _totalAssets = data.length;

      notifyListeners();
    }).catchError((error) => print(error));
  }
}
