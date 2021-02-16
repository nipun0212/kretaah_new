import 'package:flutter/material.dart';
import 'package:kretaa/bhagwan/bhagwan_home.dart';
import 'package:kretaa/global_admin/global_admin_home.dart';
import 'package:kretaa/login/screens/login.dart';
import 'package:kretaa/model/user.dart';
import 'package:kretaa/shop_admin/shop_admin_home.dart';
import 'package:provider/provider.dart';
import 'package:kretaa/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class LoginHandler extends StatefulWidget {
  const LoginHandler(
      {Key key,
      @required this.userSnapshot,
      @required this.context,
      this.firebaseUser})
      : super(key: key);
  final AsyncSnapshot<User> userSnapshot;
  final BuildContext context;
  final firebase_auth.User firebaseUser;
  @override
  _LoginHandlerState createState() => _LoginHandlerState();
}

class _LoginHandlerState extends State<LoginHandler> {
  final bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final snapshot = widget.userSnapshot;
    final firebaseUser = widget.firebaseUser;
    if (snapshot == null) return Login();
    final database = Provider.of<Database>(context, listen: false);
    User user = snapshot.data;
    if (user == null) {
      database.updateUser(
          user: User(
              name: '',
              documentId: firebaseUser.uid,
              phoneNumber: firebaseUser.phoneNumber,
              photoURL: firebaseUser.photoURL));
    }
    print('Logged as ${user.name}-->${user.phoneNumber}');

    return StreamBuilder<User>(
        stream: database.userStream(uid: user.documentId),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active &&
              !snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          if (snapshot.data.isGlobalAdmin == true) return GlobalAdminHome();
          if (snapshot.data.isShopOwner == true) return ShopAdminHome();
          return BhagwanHome();
        });
  }
}
