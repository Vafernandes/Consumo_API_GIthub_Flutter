import 'package:flutter/foundation.dart';
import 'package:teste/src/models/user_models.dart';
import 'package:teste/src/repositories/user_repository.dart';

class UserController {
  List<UserModel> users = [];
  UserRepository _userRepository;
  UserModel user = UserModel();
  final state = ValueNotifier<GitStatus>(GitStatus.start);

  UserController([UserRepository userRepository])
      : _userRepository = userRepository ?? UserRepository();

  Future start() async {
    state.value = GitStatus.loading;
    try {
      users = await _userRepository.getAllUsers();
      state.value = GitStatus.success;
    } catch (e) {
      state.value = GitStatus.error;
    }
  }

  Future<UserModel> getUserByName(String name) async {
    state.value = GitStatus.loading;
    try {
      user = await _userRepository.getUserByName(name);
      state.value = GitStatus.success;
      return user;
    } catch (e) {
      state.value = GitStatus.error;
    }
    return null;
  }
}

enum GitStatus {
  start,
  loading,
  success,
  error,
}
