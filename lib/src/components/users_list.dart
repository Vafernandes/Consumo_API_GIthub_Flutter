import 'package:flutter/material.dart';
import 'package:teste/src/controllers/user_controller.dart';

class UserList extends StatelessWidget {
  final tamanho;
  final users;
  final userController;

  const UserList({Key key, this.tamanho, this.users, this.userController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    _start() {
      return Container();
    }

    _success() {
      return ListView.builder(
        itemCount: tamanho,
        itemBuilder: (context, index) {
          var user;
          (tamanho == 1) ? user = users : user = users[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(user.avatarUrl),
                    ),
                  ),
                  Padding(
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

    _stateManeger(GitStatus status) {
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

    return Expanded(
        flex: 3,
        child: AnimatedBuilder(
          animation: userController.state,
          builder: (context, child) {
            return _stateManeger(userController.state.value);
          },
        ));
  }
}
