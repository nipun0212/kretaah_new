import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kretaa/common_widgets/form_input.dart';
import 'package:kretaa/common_widgets/custom_card.dart';
import 'package:kretaa/services/auth.dart';
import 'package:provider/provider.dart';

class Otp extends StatefulWidget {
  const Otp({Key key, this.phoneNumber, this.verificationId}) : super(key: key);

  final String phoneNumber;
  final String verificationId;
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String _otp;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP'),
        centerTitle: true,
      ),
      body: CustomCard(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (isLoading)
                Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              SizedBox(
                height: 30,
              ),
              Text(
                'OTP for Mobile Number ${widget.phoneNumber}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _buildOTPInput(),
              RaisedButton(
                onPressed: isLoading ? null : () => _onSubmit(auth),
                color: Colors.blueAccent,
                child: Text('Submit OTP'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit(AuthBase auth) async {
    setState(() {
      isLoading = true;
    });
    if (!_formKey.currentState.validate())
      setState(() {
        isLoading = false;
      });
    if (!(await auth.verifyOTP(widget.verificationId, _otp))) {
      _formKey.currentState.reset();
      _formKey.currentState.validate();
      setState(() {
        isLoading = false;
      });
    } else {
      Navigator.pop(context);
    }
  }

  FormInput _buildOTPInput() {
    return FormInput(
      name: 'OTP',
      textFormField: TextFormField(
        maxLength: 6,
        maxLines: 1,
        autofocus: true,
        validator: (v) {
          if (v.length < 6) return 'Please enter valid otp';
          return null;
        },
        onChanged: (v) {
          setState(() {
            _otp = v;
          });
        },
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: FormInput.inputDecoration(),
      ),
    );
  }
}
