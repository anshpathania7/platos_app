import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:platos_app/models/user_model.dart';
import 'package:platos_app/repository/user_repository.dart';

class UsersProvider extends ChangeNotifier {
  //
  bool isLoading;
  bool loadedSuccessfully;
  List<UserModel> allUsersEntries;
  final UserRepository _userRepository = UserRepository();

  UsersProvider()
      : isLoading = true,
        loadedSuccessfully = false,
        allUsersEntries = List.empty(growable: true);

  set _updateLoadingStatus(bool v) {
    isLoading = v;
    notifyListeners();
  }

  set _updateSuccessState(bool v) {
    loadedSuccessfully = v;
    notifyListeners();
  }

  void loadAllUsersEntries() async {
    _updateLoadingStatus = true;
    try {
      allUsersEntries = await _userRepository.getAllUserEntries();
      _updateSuccessState = true;
    } catch (e) {
      _updateSuccessState = false;
      log(e.toString());
    } finally {
      _updateLoadingStatus = false;
      notifyListeners();
    }
  }

//
  Future<void> updateUsers({required String name, required String id}) async {
    if (name.isEmpty) return;
    await _userRepository.updateUserEntry(name: name, userId: id);
    loadAllUsersEntries();
    notifyListeners();
  }

  Future<void> addUsers({required String name}) async {
    if (name.isEmpty) return;
    await _userRepository.addUserEntry(name: name);
    loadAllUsersEntries();
    notifyListeners();
  }

  Future<void> deleteUsers({required String id}) async {
    await _userRepository.deleteUserEntry(userId: id);
    loadAllUsersEntries();
    notifyListeners();
  }
//
}
