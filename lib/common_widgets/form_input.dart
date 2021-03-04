import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInput extends StatelessWidget {
  const FormInput(
      {Key? key,
      required this.name,
      required this.textFormField,
      this.sizedBoxWidth})
      : super(key: key);
  // final BuildContext context;
  // var screenSize = MediaQuery.of(context).size;
  final String name;
  final double? sizedBoxWidth;
  final TextFormField textFormField;
  static const double _fontSize = 16.0;
  static const FontWeight _fontWeight = FontWeight.w600;
  static const double _textInputGap = 4.0;

  static InputDecoration inputDecoration({String? errorText}) {
    return InputDecoration(
        contentPadding: const EdgeInsets.all(16.0),
        border: OutlineInputBorder(),
        errorText: errorText);
  }

  static Widget phoneNumberInput(Function(String) onChanged) {
    return FormInput(
      name: 'Phone Number',
      textFormField: TextFormField(
          maxLength: 10,
          maxLines: 1,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter correct Mobile Number';
            }
            return null;
          },
          onChanged: onChanged,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: FormInput.inputDecoration()),
    );
  }

  static Widget nameInput(Function(String) onChanged) {
    return FormInput(
      name: 'Phone Number',
      textFormField: TextFormField(
          maxLength: 10,
          maxLines: 1,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter correct Mobile Number';
            }
            return null;
          },
          onChanged: onChanged,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: FormInput.inputDecoration()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
            fontSize: _fontSize,
            fontWeight: _fontWeight,
          ),
        ),
        SizedBox(
          height: _textInputGap,
        ),
        SizedBox(width: sizedBoxWidth, child: textFormField),
      ],
    );
  }
}
