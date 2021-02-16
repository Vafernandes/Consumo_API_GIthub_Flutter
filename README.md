# Consumo da API do Github - Dart/Flutter

### Este projetinho teve como objetivo entender como funciona o consumo de API com a dependência HTTP do Dart/Flutter.


```dart

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

  Future<UserModel> getUserByName(String name) async {
    var response = await http.get(url + '/$name');
    var jsonResponse = convert.jsonDecode(response.body);

    UserModel user = UserModel.fromJson(jsonResponse);

    return user;
  }
}

```

## O resultado foi este:

![Alt Text](gif/apresentacao.gif)