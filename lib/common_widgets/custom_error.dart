import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError({Key? key, required this.error}) : super(key: key);

  final String error;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error Occured'),
      content: Text(error),
    );
  }
}
