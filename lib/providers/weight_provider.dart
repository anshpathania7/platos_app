import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:platos_app/models/weight_model.dart';
import 'package:platos_app/repository/weights_repository.dart';

class WeightProvider extends ChangeNotifier {
  //
  bool isLoading;
  bool loadedSuccessfully;
  late Stream<List<WeightModel>> allWeightEntries;
  final WeightRepository _weightRepository = WeightRepository();

  WeightProvider()
      : isLoading = true,
        loadedSuccessfully = false;

  set _updateLoadingStatus(bool v) {
    isLoading = v;
    notifyListeners();
  }

  set _updateSuccessState(bool v) {
    loadedSuccessfully = v;
    notifyListeners();
  }

  void loadAllWeightEntries() async {
    allWeightEntries = _weightRepository.getAllWeightEntries();
  }

//
  Future<void> updateWeight(
      {required String weight, required String id}) async {
    if (weight.isEmpty) return;
    await _weightRepository.updateWeightEntry(weightId: id, weight: weight);
    notifyListeners();
  }

  Future<void> addWeight({required String weight}) async {
    if (weight.isEmpty) return;
    await _weightRepository.addWeightEntry(weight: weight);
    notifyListeners();
  }

  Future<void> deleteWeight({required String id}) async {
    await _weightRepository.deleteWeightEntry(weightId: id);
    notifyListeners();
  }
//
}
