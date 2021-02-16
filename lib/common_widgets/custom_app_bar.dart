import 'package:flutter/material.dart';
import 'package:kretaa/services/auth.dart';

class CustomAppBar {
  CustomAppBar({@required this.title, @required this.context});
  final String title;
  final BuildContext context;
  AppBar buildAppBar(AuthBase auth) {
    return AppBar(
      title: Text(title),
      centerTitle: false,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            auth.signOut();
          },
        ),
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (Route<dynamic> route) => false);
          },
        ),
        IconButton(
          icon: Icon(Icons.verified_user),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile', (Route<dynamic> route) => false);
          },
        ),
      ],
    );
  }
}
