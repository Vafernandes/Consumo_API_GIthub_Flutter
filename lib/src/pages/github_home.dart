import 'package:flutter/material.dart';
import 'package:teste/src/components/users_list.dart';
import 'package:teste/src/controllers/user_controller.dart';

class GithubHome extends StatefulWidget {
  @override
  _GithubHomeState createState() => _GithubHomeState();
}

class _GithubHomeState extends State<GithubHome> {
  UserController userController = UserController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: Text('Área de busca'),
              ),
              UserList(
                tamanho: userController.users.length,
                users: userController.users,
              ),
            ],
          )),
    );
  }
}
