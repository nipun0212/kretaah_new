import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kretaa/common_widgets/avatar.dart';
import 'package:kretaa/common_widgets/custom_app_bar.dart';
import 'package:kretaa/common/edit_profile.dart';
import 'package:kretaa/model/user.dart';
import 'package:kretaa/services/auth.dart';
import 'package:kretaa/services/database.dart';
import 'package:kretaa/services/firebase_storage_service.dart';
import 'package:kretaa/services/image_picker_service.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({Key key, this.uid}) : super(key: key);

  final String uid;
  Future<void> _chooseAvatar(BuildContext context) async {
    try {
      // 1. Get image from picker
      final imagePicker =
          Provider.of<ImagePickerService>(context, listen: false);
      final File file =
          File((await imagePicker.pickImage(source: ImageSource.gallery)).path);
      if (file != null) {
        // 2. Upload to storage
        final storage =
            Provider.of<FirebaseStorageService>(context, listen: false);
        final downloadUrl = await storage.uploadAvatar(file: file);
        // 3. Save url to Firestore
        final database = Provider.of<Database>(context, listen: false);
        User firestoreUser = (await database
            .userStream(uid: database.loggedInUser.documentId)
            .first);
        firestoreUser = firestoreUser.copyWith(photoURL: downloadUrl);
        await database.updateUser(user: firestoreUser);
        // 4. (optional) delete local file as no longer needed
        await file.delete();
      }
    } catch (e) {
      print(e);
    }
  }

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/cover_image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // String initialText = "Initial Text";
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    Size screenSize = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(title: 'User Profile', context: context)
          .buildAppBar(auth),
      body: Container(
        // color: Colors.yellow,
        child: StreamBuilder<User>(
            stream: database.userStream(uid: uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active &&
                  snapshot.hasData) {
                User user = snapshot.data;
                print('Firestore user : ${snapshot.data}');
                return Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        buildShowImage(user, context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 42,
                            ),
                            Text(
                              '${user.name != null ? user.name : ''}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            if (uid == null)
                              IconButton(
                                color: Colors.red,
                                // iconSize: 38,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditProfile(
                                                user: user,
                                              )));
                                },
                                icon: Icon(Icons.edit),
                              ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Text('${user.phoneNumber.substring(3)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24)),
                      ],
                    ),
                  ],
                );
              } else
                return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  Widget buildShowImage(User user, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PreferredSize(
            preferredSize: Size.fromHeight(130.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Avatar(
                    radius: 75,
                    borderColor: Colors.black54,
                    borderWidth: 2.0,
                    photoUrl: user.photoURL,
                    onPressed: () {
                      if (uid == null) _chooseAvatar(context);
                    }),
                SizedBox(height: 16),
              ],
            )),
      ],
    );
  }
}
