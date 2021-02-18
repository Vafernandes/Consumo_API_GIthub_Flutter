import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'src/pages/github_home.dart';
import 'src/pages/user_bio.dart';

void main() {
  runApp(GithubUsers());
}

class GithubUsers extends StatefulWidget {
  @override
  _GithubUsersState createState() => _GithubUsersState();
}

class _GithubUsersState extends State<GithubUsers> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => GithubHome(),
        '/user-bio': (context) => UserBio(),
      },
    );
  }
}
