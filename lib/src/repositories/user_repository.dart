import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:teste/src/models/user_models.dart';
import 'package:teste/src/models/user_repo.dart';

class UserRepository {
  var url = 'https://api.github.com/users';
  Future<List<UserModel>> getAllUsers() async {
    var response = await http
        .get(url, headers: {HttpHeaders.authorizationHeader: "Vafernandes"});
    var jsonResponse = convert.jsonDecode(response.body);
    List<UserModel> users = [];

    for (var json in jsonResponse) {
      users.add(UserModel.fromJson(json));
    }

    return users;
  }

  Future<UserModel> getUserByName(String name) async {
    var response = await http.get(url + '/$name',
        headers: {HttpHeaders.authorizationHeader: "Vafernandes"});
    var jsonResponse = convert.jsonDecode(response.body);

    UserModel user = UserModel.fromJson(jsonResponse);

    return user;
  }

  Future<List<UserRepoModel>> getRepos(String user) async {
    var response = await http.get(url + '/$user' + '/repos',
        headers: {HttpHeaders.authorizationHeader: "Vafernandes"});
    var jsonResponse = convert.jsonDecode(response.body);
    List<UserRepoModel> repositories = [];

    for (var json in jsonResponse) {
      repositories.add(UserRepoModel.fromJson(json));
    }

    return repositories;
  }
}
