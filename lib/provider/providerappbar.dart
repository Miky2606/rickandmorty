import 'package:flutter/foundation.dart';

class AppBarProvider extends ChangeNotifier {
  bool _showSearch = false;
  bool get showSearch => _showSearch;

  void changeSearch() {
    if (!_showSearch) {
      _showSearch = true;
    } else {
      _showSearch = false;
    }

    notifyListeners();
  }
}
