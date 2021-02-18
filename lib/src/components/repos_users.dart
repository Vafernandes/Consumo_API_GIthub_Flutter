import 'package:flutter/material.dart';
import 'package:teste/src/controllers/user_repo_controller.dart';
import 'package:teste/src/models/user_models.dart';

class ReposUser extends StatefulWidget {
  final UserModel userModel;

  const ReposUser({Key key, this.userModel}) : super(key: key);
  @override
  _ReposUserState createState() => _ReposUserState();
}

class _ReposUserState extends State<ReposUser> {
  UserRepoController userRepoController = UserRepoController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userRepoController.getAllRepositories(widget.userModel.login);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: userRepoController.repositories.length,
        itemBuilder: (context, index) {
          var repository = userRepoController.repositories[index];
          return Card(
            child: ListTile(
              title: Text(repository.name),
            ),
          );
        },
      ),
    );
  }
}
