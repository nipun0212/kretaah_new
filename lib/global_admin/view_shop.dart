import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kretaa/common_widgets/avatar.dart';
import 'package:kretaa/common_widgets/form_input.dart';
import 'package:kretaa/global_admin/edit_shop.dart';
import 'package:kretaa/common/view_profile.dart';
import 'package:kretaa/model/user.dart';
import 'package:kretaa/model/shop.dart';
import 'package:kretaa/services/database.dart';
import 'package:kretaa/shop_admin/state/shop_freezed_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void _editShop(
    {BuildContext context, Database database, ShopFreezedModel shop}) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditShop(
                database: database,
                shop: shop,
              )));
}

Future<void> _deleteShop(
    {BuildContext context, Database database, ShopFreezedModel shop}) async {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text("Are you Sure you want to delete"),
            content: Text("Are you Sure you want to delete"),
            actions: <Widget>[
              FlatButton(
                  child: Text('Yes'),
                  onPressed: () async {
                    await database.deleteShop(documentId: shop.documentId);
                    Navigator.of(context).pop();
                  }),
              FlatButton(
                  child: Text('No'),
                  onPressed: () => Navigator.of(context).pop())
            ],
          ));
}

class ViewShop extends StatefulWidget {
  @override
  _ViewShopState createState() => _ViewShopState();
}

class _ViewShopState extends State<ViewShop> {
  String _phoneNumber;
  final TextEditingController _phoneNumberController = TextEditingController();
  String _error;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _viewFilterBar = false;
  bool _isProcessing;
  bool _isShopActive;
  Map<String, bool> _state = new Map<String, bool>();

  void _formReset() {
    setState(() {
      _phoneNumber = null;
      _phoneNumberController.clear();
      _isProcessing = null;
      _isShopActive = null;
      _state.clear();
    });
  }

  Query buildQuery(Query q) {
    // _state.forEach((key, value) {
    //   if (value) q = q.where('state', isEqualTo: key);
    // });
    if (_phoneNumber != null)
      q = q.where('ownerPhoneNumber', isEqualTo: _phoneNumber);
    if (_isProcessing != null)
      q = q.where('isProcessing', isEqualTo: _isProcessing);
    if (_isShopActive != null)
      q = q.where('isShopActive', isEqualTo: _isShopActive);

    return q;
  }

  Color getColor(bool isProcessing, bool isShopActive) {
    if (isProcessing) return Colors.orange;
    if (isShopActive) return Colors.green;
    return Colors.red;
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
            if (_error != null || value.isEmpty) {
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

  InkWell buildStringFilter({String key, bool value, VoidCallback onTap}) {
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
    return Column(
      children: <Widget>[
        SizedBox(
          height: 8.0,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     FlatButton(
        //         color: Colors.grey,
        //         shape: CircleBorder(side: BorderSide()),
        //         padding: EdgeInsets.all(16.0),
        //         onPressed: () {
        //           setState(() {
        //             _viewFilterBar = !_viewFilterBar;
        //           });
        //         },
        //         child: Text('Filters'))
        //   ],
        // ),
        if (_viewFilterBar)
          Card(
            margin: EdgeInsets.all(8),
            elevation: 8.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      if (_isLoading)
                        Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        ),
                      _buildPhoneNumberInput(),
                    ],
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    buildStringFilter(
                        key: 'Processing',
                        value: _isProcessing,
                        onTap: () {
                          setState(() {
                            if (_isProcessing == null)
                              _isProcessing = true;
                            else
                              _isProcessing = !_isProcessing;
                          });
                        }),
                    buildStringFilter(
                        key: 'Active',
                        value: _isShopActive,
                        onTap: () {
                          setState(() {
                            if (_isShopActive == null)
                              _isShopActive = true;
                            else
                              _isShopActive = !_isShopActive;
                          });
                        }),
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () => _formReset(),
                      child: Text('Reset'),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            _viewFilterBar = !_viewFilterBar;
                          });
                        },
                        child: Text('Submit')),
                  ],
                )
              ],
            ),
          ),
        StreamBuilder<List<ShopFreezedModel>>(
            stream: database.shopStream(q: (buildQuery)),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.active)
                return Center(child: CircularProgressIndicator());
              if (!snapshot.hasData) return Text('No data');
              List<ShopFreezedModel> shop = snapshot.data;
              return Expanded(
                child: RefreshIndicator(
                  onRefresh: () {
                    setState(() {
                      _viewFilterBar = !_viewFilterBar;
                    });
                    return;
                  },
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: shop.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Edit',
                              color: Colors.black45,
                              icon: Icons.more_horiz,
                              onTap: () => _editShop(
                                  context: context,
                                  database: database,
                                  shop: shop[index]),
                            ),
                            IconSlideAction(
                              caption: 'Delete',
                              color: Colors.red,
                              icon: Icons.delete,
                              onTap: () => _deleteShop(
                                  context: context,
                                  database: database,
                                  shop: shop[index]),
                            ),
                          ],
                          child: ListTileTheme(
                            iconColor: Colors.green,
                            key: Key(shop[index].documentId),
                            contentPadding: EdgeInsets.all(4.0),
                            textColor: getColor(shop[index].isProcessing,
                                shop[index].isShopActive),
                            // iconColor: Colors.orange,
                            style: ListTileStyle.drawer,
                            child: ListTile(
                                contentPadding: EdgeInsets.all(8.0),
                                key: Key(shop[index].documentId),
                                leading: StreamBuilder<User>(
                                    stream: database.userStream(
                                        uid: shop[index].ownerUID),
                                    builder: (context, userSnapshot) {
                                      if (userSnapshot.connectionState ==
                                              ConnectionState.active &&
                                          userSnapshot.hasData)
                                        return Avatar(
                                          radius: 25,
                                          borderColor: Colors.black54,
                                          borderWidth: 2.0,
                                          photoUrl:
                                              userSnapshot?.data?.photoURL,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewProfile(
                                                          uid: userSnapshot
                                                              .data.documentId,
                                                        )));
                                          },
                                        );
                                      else
                                        return Icon(Icons.photo_camera);
                                    }),
                                title: Text(
                                  shop[index].shopName,
                                  style: TextStyle(fontSize: 24),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Text('Owner Name'),
                                    StreamBuilder<User>(
                                        stream: database.userStream(
                                            uid: shop[index].ownerUID),
                                        builder: (context, userSnapshotNew) {
                                          if (userSnapshotNew.connectionState ==
                                                  ConnectionState.active &&
                                              userSnapshotNew.hasData)
                                            return Text(
                                              userSnapshotNew.data.name ?? '',
                                              style: TextStyle(fontSize: 24),
                                            );
                                          else
                                            return Text('');
                                        }),
                                    Text(
                                      shop[index]
                                              .ownerPhoneNumber
                                              .contains('+91')
                                          ? shop[index]
                                              .ownerPhoneNumber
                                              .substring(3)
                                          : shop[index].ownerPhoneNumber,
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ],
                                ),
                                isThreeLine: true),
                          ),
                        );
                      }),
                ),
              );
            }),
      ],
    );
  }
}
