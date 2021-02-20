import 'package:flutter/material.dart';
import 'package:teste/src/components/state_manager.dart';

class UserList extends StatelessWidget {
  final userController;

  const UserList({Key key, this.userController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: AnimatedBuilder(
        animation: userController.state,
        builder: (context, child) {
          return StateManager(
            userController: userController,
          );
        },
      ),
    );
  }
}
