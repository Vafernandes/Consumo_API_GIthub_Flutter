import 'package:flutter/material.dart';
import 'package:teste/src/controllers/user_controller.dart';
import 'package:teste/src/controllers/user_repo_controller.dart';
import 'package:teste/src/models/user_models.dart';

class StateManager extends StatefulWidget {
  final UserController userController;

  const StateManager({Key key, this.userController}) : super(key: key);

  @override
  _StateManagerState createState() => _StateManagerState();
}

class _StateManagerState extends State<StateManager> {
  UserRepoController userRepoController = UserRepoController();

  @override
  Widget build(BuildContext context) {
    _start() {
      return Container();
    }

    _success() {
      return ListView.builder(
        itemCount: (widget.userController.user.login != null)
            ? 1
            : widget.userController.users.length,
        itemBuilder: (context, index) {
          UserModel user;
          (widget.userController.user.login != null)
              ? user = widget.userController.user
              : user = widget.userController.users[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(9),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(user.avatarUrl),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.login,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(height: 5),
                          Text('Descrição'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.chevron_right),
                      onPressed: () async {
                        UserModel userModelResponse =
                            await userRepoController.getUserByName(user.login);

                        Navigator.pushNamed(context, '/user-bio',
                            arguments: userModelResponse);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    _loading() {
      return Center(child: CircularProgressIndicator());
    }

    _error() {
      return Center(
        child: RaisedButton(
          color: Colors.blue[100],
          child: Text(
            'Tente novamente',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            widget.userController.start();
          },
        ),
      );
    }

    _stateManager(GitStatus status) {
      switch (status) {
        case GitStatus.start:
          return _start();
          break;
        case GitStatus.success:
          return _success();
          break;
        case GitStatus.loading:
          return _loading();
          break;
        case GitStatus.error:
          return _error();
          break;
        default:
      }
    }

    return _stateManager(widget.userController.state.value);
  }
}
