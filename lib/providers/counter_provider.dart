import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier {
  int? _count;

  void get incrementCount {
    _count = (_count ?? 0) + 1;
    notifyListeners();
  }

  void get decrementCount {
    if ((_count ?? 0) == 0) return;
    _count = _count! - 1;
    notifyListeners();
  }

  String get getCount => _count?.toString() ?? '0';
}
