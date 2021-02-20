import 'package:flutter/material.dart';
import 'package:teste/src/models/user_models.dart';
import 'package:teste/src/models/user_repo.dart';

class ReposUser extends StatelessWidget {
  final UserModel userModel;
  final List<UserRepoModel> repositories;

  const ReposUser({Key key, this.userModel, this.repositories})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ListView.builder(
        itemCount: repositories.length,
        itemBuilder: (context, index) {
          var repository = repositories[index];
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
