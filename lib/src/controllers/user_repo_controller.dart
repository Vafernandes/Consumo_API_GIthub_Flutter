import 'package:teste/src/models/user_repo.dart';
import 'package:teste/src/repositories/user_repository.dart';

class UserRepoController {
  List<UserRepo> repositories = [];
  UserRepository _userRepository;

  UserRepoController([UserRepository userRepository])
      : _userRepository = userRepository ?? UserRepository();

  Future getAllRepositories(String name) async {
    repositories = await _userRepository.getRepos(name);
    print(repositories);
  }
}
