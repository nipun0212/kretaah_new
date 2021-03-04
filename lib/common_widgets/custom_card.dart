import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key key, @required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
        Radius.circular(16.0),
      )),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
