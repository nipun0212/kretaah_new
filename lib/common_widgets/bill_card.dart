import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kretaa/common_widgets/avatar.dart';
import 'package:kretaa/common_widgets/custom_app_bar.dart';
import 'package:kretaa/common/edit_profile.dart';
import 'package:kretaa/model/bill.dart';
import 'package:kretaa/model/user.dart';
import 'package:kretaa/model/shop.dart';
import 'package:kretaa/services/auth.dart';
import 'package:kretaa/services/database.dart';
import 'package:kretaa/services/firebase_storage_service.dart';
import 'package:kretaa/services/image_picker_service.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class BillCard extends StatelessWidget {
  const BillCard(
      {Key key,
      this.uid,
      @required this.billDocumentId,
      @required this.shopDocumentId})
      : super(key: key);

  final String uid;
  final String billDocumentId;
  final String shopDocumentId;

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
        User user = (await database
            .userStream(uid: database.loggedInUser.documentId)
            .first);
        user = user.copyWith(photoURL: downloadUrl);
        await database.updateUser(user: user);
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
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World"),
          ); // Center
        })); // P
    if (uid == null)
      return buildShopBillView(context, auth, database);
    else
      return buildUserBillView(context, auth, database);
  }

  Widget buildShopBillView(
      BuildContext context, AuthBase auth, Database database) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Bills', context: context).buildAppBar(auth),
      body: Container(
        // color: Colors.yellow,
        child: StreamBuilder<Shop>(
            stream: database.shopDocumentStream(shopId: shopDocumentId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active &&
                  snapshot.hasData) {
                Shop shop = snapshot.data;
                print('Firestore user : ${snapshot.data}');
                return Column(
                  children: <Widget>[
                    // buildShowImage(user, context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 42,
                        ),
                        Text(
                          '${shop.shopName.toUpperCase()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Text('${shop.ownerPhoneNumber.substring(3)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                    SizedBox(height: 16.0),
                    Card(
                      margin: EdgeInsets.all(16),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StreamBuilder<Bill>(
                              stream: database.billStream(
                                  billDocumentId: billDocumentId,
                                  shopDocumentId: shopDocumentId),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.active) {
                                  if (snapshot.data != null)
                                    // print('snapshot dara= ${snapshot.data}');
                                    return Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(children: [
                                        if (snapshot.data?.description != null)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Description',
                                              ),
                                              Text(
                                                  '${snapshot.data?.description}'),
                                            ],
                                          ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Amount',
                                            ),
                                            Text('${snapshot.data?.amount}'),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Last Updated On'),
                                            Text(
                                                '${DateFormat.yMMMEd().format(snapshot.data?.updatedOn?.toDate())}'),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Reward Points'),
                                            Text(
                                                '${snapshot.data?.rewardPointsGiven}'),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Reward Points Reedemed'),
                                            Text(
                                                '${snapshot.data?.redeemRewardPoints == null ? 0 : snapshot.data?.redeemRewardPoints}'),
                                          ],
                                        ),
                                      ]),
                                    );
                                  else
                                    return Center(
                                        child: CircularProgressIndicator());
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              }),
                        ],
                      ),
                    )
                  ],
                );
              } else
                return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  Widget buildUserBillView(
      BuildContext context, AuthBase auth, Database database) {
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
                return Column(
                  children: <Widget>[
                    buildShowImage(user, context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 42,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 48),
                          child: Text(
                            '${user.name != null ? user.name : ''}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
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
                    SizedBox(height: 16.0),
                    Card(
                      margin: EdgeInsets.all(16),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StreamBuilder<Bill>(
                              stream: database.billStream(
                                  billDocumentId: billDocumentId,
                                  shopDocumentId: shopDocumentId),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.active) {
                                  if (snapshot.data != null)
                                    // print('snapshot dara= ${snapshot.data}');
                                    return Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(children: [
                                        if (snapshot.data?.description != null)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Description',
                                              ),
                                              Text(
                                                  '${snapshot.data?.description}'),
                                            ],
                                          ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Amount',
                                            ),
                                            Text('${snapshot.data?.amount}'),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Last Updated On'),
                                            Text(
                                                '${DateFormat.yMMMEd().format(snapshot.data?.updatedOn?.toDate())}'),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Reward Points'),
                                            Text(
                                                '${snapshot.data?.rewardPointsGiven}'),
                                          ],
                                        ),
                                      ]),
                                    );
                                  else
                                    return Center(
                                        child: CircularProgressIndicator());
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              }),
                        ],
                      ),
                    )
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
