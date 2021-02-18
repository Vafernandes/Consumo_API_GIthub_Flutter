import 'package:flutter/material.dart';
import 'package:teste/src/components/area_pesquisa.dart';
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
    super.initState();
    userController.start();
  }

  buscaUserByName(String valor) {
    setState(() {
      userController.getUserByName(valor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            AreaPesquisa(buscaUSerByName: buscaUserByName),
            UserList(
              userController: userController,
              goToBio: buscaUserByName,
            ),
          ],
        ),
      ),
    );
  }
}
