import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kretaa/common_widgets/avatar.dart';
import 'package:kretaa/common_widgets/bill_card.dart';
import 'package:kretaa/common_widgets/form_input.dart';
import 'package:kretaa/common/view_profile.dart';
import 'package:kretaa/model/bill.dart';
import 'package:kretaa/model/bill_notifier.dart';
import 'package:kretaa/model/user.dart';
import 'package:kretaa/services/database.dart';
import 'package:kretaa/shop_admin/bills/edit_bill.dart';
import 'package:kretaa/shop_admin/bills/edit_bill_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'edit_bill_model.dart';

void _editBill({required BuildContext context, Database? database, Bill? bill}) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditBill(
                database: database,
                bill: bill,
              )));
}

Future<void> _deleteBill(
    {required BuildContext context, Database? database, Bill? bill}) async {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text("Are you Sure you want to delete"),
            content: Text("Are you Sure you want to delete"),
            actions: <Widget>[
              FlatButton(
                  child: Text('Yes'),
                  onPressed: () async {
                    await database!.deleteBill(
                        documentId: bill!.documentId,
                        shopDocumentId: database.loggedInUser!.shopDocumentId);
                    Navigator.of(context).pop();
                  }),
              FlatButton(
                  child: Text('No'),
                  onPressed: () => Navigator.of(context).pop())
            ],
          ));
}

class ViewBillsNotifier extends StatefulWidget {
  @override
  _ViewBillsNotifierState createState() => _ViewBillsNotifierState();
}

class _ViewBillsNotifierState extends State<ViewBillsNotifier> {
  String? _phoneNumber;
  final TextEditingController _phoneNumberController = TextEditingController();
  String? _error;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _viewFilterBar = false;
  bool? _isProcessing;
  bool? _isShopActive;
  bool _sortbyDate = true;
  Map<String, bool> _state = new Map<String, bool>();

  void _formReset() {
    setState(() {
      _phoneNumber = null;
      _phoneNumberController.clear();
      _isProcessing = null;
      _isShopActive = null;
      _sortbyDate = true;
      _state.clear();
    });
  }

  Query buildQuery(Query q) {
    // _state.forEach((key, value) {
    //   if (value) q = q.where('state', isEqualTo: key);
    // });
    if (_phoneNumber != null)
      q = q.where('customerPhoneNumber', isEqualTo: _phoneNumber);
    if (_isProcessing != null)
      q = q.where('isProcessing', isEqualTo: _isProcessing);
    if (_isShopActive != null)
      q = q.where('isShopActive', isEqualTo: _isShopActive);
    if (_sortbyDate)
      q = q.orderBy('updatedOn', descending: true);
    else
      q = q.orderBy('updatedOn', descending: false);
    return q;
  }

  Color getColor(bool isProcessing, bool? isShopActive) {
    if (isProcessing) return Colors.orange;
    return Colors.green;
  }

  FormInput _buildPhoneNumberInput() {
    return FormInput(
      name: 'Phone Number',
      textFormField: TextFormField(
          maxLength: 10,
          maxLines: 1,
          controller: _phoneNumberController,
          keyboardType: TextInputType.phone,
          autofocus: true,
          validator: (value) {
            if (_error != null || value!.isEmpty) {
              return 'Please enter correct Mobile Number';
            }
            return null;
          },
          onChanged: (v) => {
                if (v.length == 10)
                  setState(() {
                    _phoneNumber = '+91' + v;
                  })
              },
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: FormInput.inputDecoration()),
    );
  }

  InkWell buildStringFilter({required String key, bool? value, VoidCallback? onTap}) {
    return InkWell(
        highlightColor: value != null && value ? Colors.green : Colors.black,
        onTap: onTap,
        child: Text(
          key,
          style: TextStyle(
            color: value != null && value ? Colors.green : Colors.black,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return GestureDetector(
      onTap: () => print('dd'),
      onPanDown: (v) => print('cc'),
      child: StreamBuilder<List<BillNotifier>>(
          stream: database.billsStreamNotifier(
              q: buildQuery,
              shopDocumentId: database.loggedInUser!.shopDocumentId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data != null) {
                List<BillNotifier> bill = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: bill.length,
                      itemBuilder: (context, index) {
                        print('billNew = $bill');
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => BillCard(
                                          billDocumentId:
                                              bill[index].documentId,
                                          shopDocumentId:
                                              bill[index].shopDocumentId,
                                          uid: bill[index].customerUID,
                                        )));
                          },
                          child: Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            actionExtentRatio: 0.25,
                            secondaryActions: <Widget>[
                              IconSlideAction(
                                caption: 'Edit',
                                color: Colors.black45,
                                icon: Icons.more_horiz,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditBillNotifier.create(
                                                  context, bill[index])));
                                },

                                // Navigator.push( context,EditBillNotifier.create(
                                //     context,
                                //     EditBillModel(
                                //         amount: 10, rewardPointGiven: 20)))
                                // ._editBill(
                                //     context: context,
                                //     database: database,
                                //     bill: bill[index]),
                              ),
                              IconSlideAction(
                                caption: 'Delete',
                                color: Colors.red,
                                icon: Icons.delete,
                                // onTap: () => _deleteBill(
                                //     context: context,
                                //     database: database,
                                //     bill: bill[index]),
                              ),
                            ],
                            child: ListTileTheme(
                              iconColor: Colors.green,
                              key: Key(bill[index].documentId!),
                              contentPadding: EdgeInsets.all(4.0),
                              textColor:
                                  getColor(bill[index].isProcessing!, null),
                              // iconColor: Colors.orange,
                              style: ListTileStyle.drawer,
                              child: ListTile(
                                  contentPadding: EdgeInsets.all(8.0),
                                  key: Key(bill[index].documentId!),
                                  leading: StreamBuilder<User>(
                                      stream: database.userStream(
                                          uid: bill[index].customerUID),
                                      builder: (context, userSnapshot) {
                                        if (userSnapshot.connectionState ==
                                                ConnectionState.active &&
                                            userSnapshot.hasData)
                                          return buildLeadingAvatar(
                                              userSnapshot, context);
                                        else
                                          return Icon(Icons.photo_camera);
                                      }),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        bill[index].amount.toString(),
                                        style: TextStyle(fontSize: 22),
                                      ),
                                      // Text(
                                      //   bill[index].item[0].cgst.toString() ??
                                      //       'New',
                                      //   style: TextStyle(fontSize: 22),
                                      // ),
                                      Text(
                                        _getDate(
                                            timestamp: bill[index]?.updatedOn),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        _getTime(
                                            timestamp: bill[index].updatedOn),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      StreamBuilder<User>(
                                          stream: database.userStream(
                                              uid: bill[index].customerUID),
                                          builder: (context, userSnapshotNew) {
                                            if (userSnapshotNew
                                                        .connectionState ==
                                                    ConnectionState.active &&
                                                userSnapshotNew.hasData)
                                              return Text(
                                                userSnapshotNew.data!.name ?? '',
                                                style: TextStyle(fontSize: 24),
                                              );
                                            else
                                              return Text('');
                                          }),
                                      Text(
                                        bill[index]
                                                .customerPhoneNumber!
                                                .contains('+91')
                                            ? bill[index]
                                                .customerPhoneNumber!
                                                .substring(3)
                                            : bill[index].customerPhoneNumber!,
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ],
                                  ),
                                  isThreeLine: true),
                            ),
                          ),
                        );
                      }),
                );
              } else
                return Text('No data');
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  Avatar buildLeadingAvatar(
      AsyncSnapshot<User> userSnapshot, BuildContext context) {
    return Avatar(
      radius: 25,
      borderColor: Colors.black54,
      borderWidth: 2.0,
      photoUrl: userSnapshot?.data?.photoURL,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewProfile(
                      uid: userSnapshot.data!.documentId,
                    )));
      },
    );
  }
}

String _getDate({timestamp}) {
  // if (timestamp == null) return '';
  // dynamic t = timestamp.millisecondsSinceEpoch;
  // var date = new DateTime.fromMillisecondsSinceEpoch(t);
  // print(date.toLocal().toIso8601String());
  // return date.toLocal().toIso8601String().split('T')[0];
  if (timestamp == null) return "";
  return DateFormat.yMMMEd().format(timestamp.toDate());
}

String _getTime({timestamp}) {
  if (timestamp == null) return '';
  dynamic t = timestamp.millisecondsSinceEpoch;
  var date = new DateTime.fromMillisecondsSinceEpoch(t);
  print(date.toLocal().toIso8601String());
  return date.toLocal().toIso8601String().split('T')[1].substring(0, 5);
}
