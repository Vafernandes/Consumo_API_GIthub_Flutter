import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'src/pages/github_home.dart';

void main() {
  runApp(GithubUsers());
}

class GithubUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => GithubHome(),
      },
    );
  }
}
