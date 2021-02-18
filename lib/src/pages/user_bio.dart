import 'package:flutter/material.dart';
import 'package:teste/src/components/bio.dart';
import 'package:teste/src/models/user_models.dart';

class UserBio extends StatelessWidget {
  // final userController;

  // const UserBio({Key key, this.userController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UserModel userModel = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Bio(
            userModel: userModel,
          ),
        ),
      ),
    );
  }
}
