import 'package:flutter/material.dart';
import 'package:kretaa/services/auth.dart';
import 'package:provider/provider.dart';

class GlobalAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('GlobalAdmin'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              auth.signOut();
            },
          )
        ],
      ),
      body: Container(
        color: Colors.black,
      ),
    );
  }
}
