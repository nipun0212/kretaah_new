import 'package:flutter/material.dart';
import 'package:kretaa/common_widgets/custom_app_bar.dart';
import 'package:kretaa/common_widgets/custom_card.dart';
import 'package:kretaa/common_widgets/form_input.dart';
import 'package:kretaa/model/user.dart';
import 'package:kretaa/services/auth.dart';
import 'package:kretaa/services/database.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key, this.user}) : super(key: key);

  final User user;

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String _name;
  @override
  initState() {
    _name = widget.user?.name;
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(title: 'Edit Profile', context: context)
          .buildAppBar(auth),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomCard(
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: FormInput(
                        sizedBoxWidth: 26 * 8.0,
                        name: 'Name',
                        textFormField: TextFormField(
                          maxLength: 26,
                          // style: TextStyle(
                          //     fontWeight: FontWeight.bold, fontSize: 24),
                          initialValue: _name != null ? widget.user?.name : '',
                          onChanged: (v) {
                            setState(() {
                              print(v);
                              _name = v;
                            });
                          },
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () async {
                        final database =
                            Provider.of<Database>(context, listen: false);
                        User firestoreUser = (await database
                            .userStream(uid: database.loggedInUser.documentId)
                            .first);
                        firestoreUser = firestoreUser.copyWith(name: _name);
                        await database.updateUser(user: firestoreUser);
                        Navigator.pop(context);
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
