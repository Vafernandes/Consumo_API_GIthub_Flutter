import 'package:flutter/material.dart';
import 'package:teste/src/controllers/user_controller.dart';

class StateManager extends StatelessWidget {
  final UserController userController;
  final Function(String) goToBio;

  const StateManager({Key key, this.userController, this.goToBio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _start() {
      return Container();
    }

    _success() {
      return ListView.builder(
        itemCount: (userController.user.login != null)
            ? 1
            : userController.users.length,
        itemBuilder: (context, index) {
          var user;
          (userController.user.login != null)
              ? user = userController.user
              : user = userController.users[index];
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
                      onPressed: () {
                        goToBio(user.login);
                        Navigator.pushNamed(context, '/user-bio',
                            arguments: user);
                        print(user.login);
                        print(user.bio);
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
            userController.start();
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

    return _stateManager(userController.state.value);
  }
}
