import 'package:flutter/foundation.dart';
import 'package:platos_app/repository/counter_repository.dart';

class CounterProvider extends ChangeNotifier {
  int? _count;
  bool _isLoading = true;

  CounterProvider() {
    _getIntialValueFromDB();
  }

  set _setLoadingStateTo(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  bool get isLoadingData => _isLoading;

  Future<void> _getIntialValueFromDB() async {
    _setLoadingStateTo = true;
    final countInString = await CounterRepository().getCountFromDatabase();
    _count = int.tryParse(countInString) ?? 0;
    _setLoadingStateTo = false;
    notifyListeners();
  }

  void get incrementCount {
    _count = (_count ?? 0) + 1;
    CounterRepository().updateCountInDatabase(value: _count!);
    notifyListeners();
  }

  String get getCount => _count?.toString() ?? '0';
}
