import 'package:teste/src/models/user_models.dart';
import 'package:teste/src/models/user_repo.dart';
import 'package:teste/src/repositories/user_repository.dart';

class UserRepoController {
  List<UserRepoModel> repositories = [];
  UserRepository _userRepository;
  UserModel user = UserModel();

  UserRepoController([UserRepository userRepository])
      : _userRepository = userRepository ?? UserRepository();

  Future getAllRepositories(String name) async {
    repositories = await _userRepository.getRepos(name);
  }

  Future<UserModel> getUserByName(String name) async {
    user = await _userRepository.getUserByName(name);
    return user;
  }
}
