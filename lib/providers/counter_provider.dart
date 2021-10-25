import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:platos_app/repository/counter_repository.dart';

class CounterProvider extends ChangeNotifier {
  int? _count;
  Stream<String>? _countStream;
  bool _isLoading = true;

  Stream<String> get getCountStream => _countStream!;

  set _setLoadingStateTo(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  bool get isLoadingData => _isLoading;

  Future<void> _getIntialValueFromDB({required bool isPageOne}) async {
    _setLoadingStateTo = true;
    if (isPageOne) {
      final countInString = await CounterRepository().getCountForPageOne();
      _count = int.tryParse(countInString) ?? 0;
      log(_count.toString());
    } else {
      _countStream = CounterRepository().getCountForPageTwo();
    }
    _setLoadingStateTo = false;
    notifyListeners();
  }

  Future<void> pushedPageOne() async {
    await _getIntialValueFromDB(isPageOne: true);
  }

  Future<void> pushedPageTwo() async {
    await _getIntialValueFromDB(isPageOne: false);
  }

  void get incrementCount {
    _count = (_count ?? 0) + 1;
    CounterRepository().updateCountInPageOne(value: _count!);
    CounterRepository().updateCountInPageTwo(value: _count!);
    notifyListeners();
  }

  String get getCount => _count?.toString() ?? '0';
}
