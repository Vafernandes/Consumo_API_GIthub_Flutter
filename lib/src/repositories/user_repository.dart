import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:teste/src/models/user_models.dart';

class UserRepository {
  var url = 'https://api.github.com/users';

  Future<List<UserModel>> getAllUsers() async {
    var response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    List<UserModel> users = [];

    for (var json in jsonResponse) {
      users.add(UserModel.fromJson(json));
    }

    return users;
  }
}
