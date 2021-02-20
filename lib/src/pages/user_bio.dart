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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
            child: Stack(
          children: [
            Bio(userModel: userModel),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 20),
              child: Container(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  child: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
