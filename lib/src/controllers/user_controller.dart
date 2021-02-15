import 'package:teste/src/models/user_models.dart';
import 'package:teste/src/repositories/user_repository.dart';

class UserController {
  List<UserModel> users = [];
  UserRepository _userRepository;
  UserModel user = UserModel();

  UserController([UserRepository userRepository])
      : _userRepository = userRepository ?? UserRepository();

  Future start() async {
    users = await _userRepository.getAllUsers();
  }

  Future getUserByName(String name) async {
    user = await _userRepository.getUserByName(name);
    print(user);
  }
}
