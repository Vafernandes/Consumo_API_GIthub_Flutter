import 'package:flutter/material.dart';
import 'package:teste/src/components/repos_users.dart';
import 'package:teste/src/models/user_models.dart';

class Bio extends StatelessWidget {
  final UserModel userModel;

  const Bio({Key key, this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(userModel.avatarUrl),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                (userModel.name == null) ? '' : userModel.name,
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(height: 10),
                          Expanded(
                            child: Text((userModel.login == null)
                                ? ''
                                : userModel.login),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        (userModel.bio == null) ? '' : userModel.bio,
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.account_balance_sharp),
                          Container(width: 10),
                          Text(
                            (userModel.company == null)
                                ? ''
                                : userModel.company,
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.clear_all),
                            Container(width: 10),
                            Text((userModel.followers == 0)
                                ? ''
                                : '${userModel.followers.toString()} seguidores'),
                            Container(width: 10),
                            Text((userModel.following == 0)
                                ? ''
                                : '${userModel.following.toString()} seguindo'),
                            Container(width: 10),
                            Text((userModel.publicRepos == 0)
                                ? ''
                                : '${userModel.publicRepos.toString()} repos'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        ReposUser(
          userModel: userModel,
        ),
      ],
    );
  }
}
