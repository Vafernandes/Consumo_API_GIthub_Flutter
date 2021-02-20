import 'package:flutter/material.dart';
import 'package:teste/src/components/repos_users.dart';
import 'package:teste/src/controllers/user_repo_controller.dart';
import 'package:teste/src/models/user_models.dart';
import 'package:teste/src/models/user_repo.dart';

class Bio extends StatefulWidget {
  final UserModel userModel;

  const Bio({Key key, this.userModel}) : super(key: key);

  @override
  _BioState createState() => _BioState();
}

class _BioState extends State<Bio> {
  UserRepoController userRepoController = UserRepoController();
  List<UserRepoModel> repositories = [];

  carregarRepositorios(String userLogin) async {
    await userRepoController.getAllRepositories(userLogin);

    setState(() {
      repositories = userRepoController.repositories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 8, left: 8, right: 8),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(widget.userModel.avatarUrl),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (widget.userModel.name == null)
                                    ? ''
                                    : widget.userModel.name,
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(height: 10),
                              Text((widget.userModel.login == null)
                                  ? ''
                                  : widget.userModel.login),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          (widget.userModel.bio == null)
                              ? ''
                              : widget.userModel.bio,
                        ),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(child: Icon(Icons.account_balance_sharp)),
                            Container(width: 10),
                            Expanded(
                              flex: 10,
                              child: Container(
                                child: Text(
                                  (widget.userModel.company == null)
                                      ? '-'
                                      : widget.userModel.company,
                                ),
                              ),
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
                              Text((widget.userModel.followers == 0)
                                  ? ''
                                  : '${widget.userModel.followers.toString()} seguidores'),
                              Container(width: 10),
                              Text((widget.userModel.following == 0)
                                  ? ''
                                  : '${widget.userModel.following.toString()} seguindo'),
                              Container(width: 10),
                              Text((widget.userModel.publicRepos == 0)
                                  ? ''
                                  : '${widget.userModel.publicRepos.toString()} repos'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          color: Colors.blue,
                          child: Text(
                            'Carregar repositórios',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            carregarRepositorios(widget.userModel.login);
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ReposUser(
            userModel: widget.userModel,
            repositories: repositories,
          ),
        ],
      ),
    );
  }
}
