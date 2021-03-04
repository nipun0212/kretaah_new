import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kretaa/common_widgets/form_input.dart';
import 'package:kretaa/common_widgets/custom_card.dart';
import 'package:kretaa/services/auth.dart';
import './otp.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? _phoneNumber;
  bool _isLoading = false;
  // String _prefix = '+';
  // String _countryCode = '91';
  String? _error;
  final _formKey = GlobalKey<FormState>();
  FocusNode? _phoneNumberFocus;

  @override
  void initState() {
    super.initState();

    _phoneNumberFocus = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _phoneNumberFocus!.dispose();

    super.dispose();
  }

  void codeSent(String verificationId, [int? forceResendingToken]) {
    setState(() {
      _isLoading = false;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Otp(
                  phoneNumber: _phoneNumber,
                  verificationId: verificationId,
                )));
  }

  void verificationFailed(dynamic e) {
    print('erorrrr = ${e.message} and code = ${e.code}');
    setState(() {
      _isLoading = false;
      _error = e.message;
      _formKey.currentState!.validate();
      _error = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('Login'), centerTitle: true),
      body: SingleChildScrollView(
        child: CustomCard(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (_isLoading)
                  Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Please Enter your Mobile Number',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Expanded(
                    //   flex: 1,
                    //   child: FormInput(
                    //     name: 'Prefix',
                    //     textFormField: TextFormField(
                    //         maxLength: 1,
                    //         readOnly: true,
                    //         initialValue: _prefix,
                    //         decoration: FormInput.inputDecoration()),
                    //   ),
                    // ),
                    // Expanded(
                    //   flex: 1,
                    //   child: FormInput(
                    //     sizedBoxWidth: null,
                    //     name: 'Code',
                    //     textFormField: TextFormField(
                    //         initialValue: _countryCode,
                    //         maxLength: 4,
                    //         maxLines: 1,
                    //         textInputAction: TextInputAction.next,
                    //         keyboardType: TextInputType.numberWithOptions(),
                    //         validator: (value) {
                    //           if (_error != null || value.isEmpty) {
                    //             return _error;
                    //           }
                    //           return null;
                    //         },
                    //         onFieldSubmitted: (v) =>
                    //             {FocusScopeNode().autofocus(_phoneNumberFocus)},
                    //         onChanged: (v) => {
                    //               setState(() {
                    //                 _countryCode = v;
                    //               })
                    //             },
                    //         inputFormatters: [
                    //           FilteringTextInputFormatter.allow(
                    //               RegExp(r'[0-9]')),
                    //         ],
                    //         decoration: FormInput.inputDecoration()),
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 2,
                    // ),
                    Expanded(flex: 3, child: _buildPhoneNumberInput(auth)),
                  ],
                ),
                RaisedButton(
                  onPressed: _isLoading ? null : () => _sendOTP(auth),
                  color: Colors.blueAccent,
                  child: Text('Get OTP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _sendOTP(AuthBase auth) {
    if (_isLoading) return;
    if (!(_formKey.currentState!.validate())) return;
    print('phone = $_phoneNumber');
    setState(() {
      _isLoading = true;
    });
    auth.sendOTP(_phoneNumber, codeSent, verificationFailed);
  }

  FormInput _buildPhoneNumberInput(auth) {
    return FormInput(
      name: 'Phone Number',
      sizedBoxWidth: null,
      textFormField: TextFormField(
          maxLength: 10,
          maxLines: 1,
          keyboardType: TextInputType.phone,
          autofocus: true,
          focusNode: _phoneNumberFocus,
          textInputAction: TextInputAction.send,
          validator: (value) {
            if (_error != null || value!.isEmpty) {
              return _error;
            }
            if (value.length < 10)
              return 'Please enter 10 digit correct number';
            return null;
          },
          onFieldSubmitted: (v) {
            print(v);
            if (_isLoading == false) _sendOTP(auth);
          },
          onChanged: (v) => {
                setState(() {
                  _phoneNumber = v;
                })
              },
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: FormInput.inputDecoration()),
    );
  }
}
