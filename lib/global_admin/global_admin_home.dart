import 'package:flutter/material.dart';
import 'package:kretaa/common_widgets/custom_app_bar.dart';
import 'package:kretaa/global_admin/edit_shop.dart';
import 'package:kretaa/global_admin/view_shop.dart';
import 'package:kretaa/services/auth.dart';
import 'package:kretaa/services/database.dart';
import 'package:provider/provider.dart';

class GlobalAdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    final database = Provider.of<Database>(context, listen: false);

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/profile', (Route<dynamic> route) => false);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditShop(
                        database: database,
                      )));
        },
      ),
      appBar: CustomAppBar(
        title: 'Home',
        context: context,
      ).buildAppBar(auth),
      body: ViewShop(),
    );
  }
}
