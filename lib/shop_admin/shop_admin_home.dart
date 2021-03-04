import 'package:flutter/material.dart';
import 'package:kretaa/common_widgets/custom_app_bar.dart';
import 'package:kretaa/global_admin/edit_shop.dart';
import 'package:kretaa/global_admin/view_shop.dart';
import 'package:kretaa/services/auth.dart';
import 'package:kretaa/services/database.dart';
import 'package:kretaa/shop_admin/bills/edit_bill.dart';
import 'package:kretaa/shop_admin/bills/edit_bill_notifier.dart';
import 'package:kretaa/shop_admin/bills/view_bills.dart';
import 'package:kretaa/shop_admin/customers/customer_list.dart';
import 'package:kretaa/shop_admin/setting.dart';
import 'package:kretaa/shop_admin/view_pdf.dart';
import 'package:provider/provider.dart';

import 'bills/view_bills_notifier.dart';

class ShopAdminHome extends StatefulWidget {
  @override
  _ShopAdminHomeState createState() => _ShopAdminHomeState();
}

class _ShopAdminHomeState extends State<ShopAdminHome> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<String> title = ['Bills', 'Customers', 'RewardSetting', 'View Pdf'];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    final database = Provider.of<Database>(context, listen: false);
    List<Widget> widgetOptions = <Widget>[
      ViewBillsNotifier(),
      CustomerList(),
      Setting.create(context, 'ddd'),
      // ViewPdf()
    ];
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Setting()));
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Bills',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Customers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'RewardSetting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.picture_as_pdf),
            label: 'Pdf',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EditBillNotifier.create(context, null)));
        },
      ),
      appBar: CustomAppBar(
        title: title[_selectedIndex],
        context: context,
      ).buildAppBar(auth),
      body: widgetOptions.elementAt(_selectedIndex),
      // body: CustomerList(),
    );
  }
}
