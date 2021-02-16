import 'package:flutter/material.dart';
import 'package:kretaa/bhagwan/my_bills.dart';
import 'package:kretaa/common_widgets/custom_app_bar.dart';
import 'package:kretaa/services/auth.dart';
import 'package:kretaa/services/database.dart';

import 'package:provider/provider.dart';

import 'shop_list.dart';

class BhagwanHome extends StatefulWidget {
  @override
  _BhagwanHomeState createState() => _BhagwanHomeState();
}

class _BhagwanHomeState extends State<BhagwanHome> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<String> title = ['Bills', 'Shops', 'Profile'];
  static List<Widget> widgetOptions = <Widget>[
    MyBills(),
    // Text('Nipun'),
    ShopList(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
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

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Bills',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Shops',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
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
