import 'package:flutter/material.dart';
import 'package:teste/src/models/user_models.dart';
import 'package:teste/src/models/user_repo.dart';
import 'package:url_launcher/url_launcher.dart';

class ReposUser extends StatelessWidget {
  final UserModel userModel;
  final List<UserRepoModel> repositories;

  const ReposUser({Key key, this.userModel, this.repositories})
      : super(key: key);

  _direcionar(String login, String repoName) async {
    var url = 'https://github.com/$login/$repoName';
    await launch(url);
  }

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
              title: TextButton(
                child: Text(repository.name),
                onPressed: () {
                  _direcionar(repository.owner.login, repository.name);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
