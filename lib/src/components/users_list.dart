import 'package:flutter/material.dart';
import 'package:teste/src/components/state_manager.dart';

class UserList extends StatelessWidget {
  final userController;
  final Function(String) goToBio;

  const UserList({Key key, this.userController, this.goToBio})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: AnimatedBuilder(
        animation: userController.state,
        builder: (context, child) {
          return StateManager(
            userController: userController,
            goToBio: goToBio,
          );
        },
      ),
    );
  }
}
