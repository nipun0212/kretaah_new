import 'package:flutter/material.dart';
import 'package:kretaa/common/view_profile.dart';
import 'package:kretaa/login/login_handler.dart';
import 'package:kretaa/login/provide_service_descendants.dart';
import 'package:kretaa/services/auth.dart';
import 'package:kretaa/services/firestore_service.dart';
import 'package:kretaa/services/image_picker_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseFirestore.instance.settings =
  //     Settings(host: "10.0.2.2:8087", sslEnabled: false);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthBase>(
          create: (context) => Auth(),
        ),
        Provider<ImagePickerService>(
          create: (context) => ImagePickerService(),
        ),
        Provider<FirestoreService>(
          create: (context) => FirestoreService(),
        )
      ],
      child: ProvideServiceDescendants(
          builder: (context, userSnapshot, firebaseUser) {
        return MaterialApp(
          routes: {
            '/home': (context) => LoginHandler(
                  context: context,
                  userSnapshot: userSnapshot,
                  firebaseUser: firebaseUser,
                ),
            '/profile': (context) => ViewProfile(),
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginHandler(
            context: context,
            userSnapshot: userSnapshot,
            firebaseUser: firebaseUser,
          ),
        );
      }),
    );
  }
}
