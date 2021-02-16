import 'package:flutter/material.dart';
import 'package:kretaa/model/user.dart';
import 'package:kretaa/services/api_path.dart';
import 'package:kretaa/services/auth.dart';
import 'package:kretaa/services/database.dart';
import 'package:kretaa/services/firebase_storage_service.dart';
import 'package:kretaa/services/firestore_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class ProvideServiceDescendants extends StatelessWidget {
  const ProvideServiceDescendants({Key key, @required this.builder})
      : super(key: key);
  final Widget Function(BuildContext, AsyncSnapshot<User>, firebase_auth.User)
      builder;
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    final firestoreService =
        Provider.of<FirestoreService>(context, listen: false);
    return StreamBuilder<firebase_auth.User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active &&
              !snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          if (snapshot.data == null) {
            print('Please login to continue');
            return builder(context, null, null);
          }
          final firebase_auth.User userFromFirebase = snapshot.data;
          print("Firbase User --> $userFromFirebase");
          return StreamBuilder<User>(
              stream: firestoreService.documentStream(
                  path: ApiPath.user(uid: userFromFirebase.uid),
                  builder: (data, documentId) =>
                      User.fromMap(data, documentId)),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.active)
                  return Center(child: CircularProgressIndicator());
                User user = snapshot.data;
                return MultiProvider(
                  providers: [
                    Provider<Database>(
                      create: (_) => FirestoreDatabase(user: user),
                    ),
                    Provider<FirebaseStorageService>(
                      create: (_) =>
                          FirebaseStorageService(uid: userFromFirebase.uid),
                    ),
                  ],
                  child: builder(context, snapshot, userFromFirebase),
                );
              });
        });
  }
}
