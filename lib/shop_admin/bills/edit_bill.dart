import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kretaa/common_widgets/custom_card.dart';
import 'package:kretaa/common_widgets/form_input.dart';
import 'package:kretaa/model/bill.dart';
import 'package:kretaa/model/customer.dart';
import 'package:kretaa/model/item.dart';
import 'package:kretaa/model/user.dart';
import 'package:kretaa/model/setting_doc.dart';
import 'package:kretaa/services/database.dart';
import 'package:kretaa/shop_admin/state/setting_model.dart';
import 'package:kretaa/shop_admin/state/setting_state.dart';
import 'package:provider/provider.dart';

class EditBill extends StatefulWidget {
  final Database? database;
  final Bill? bill;
  const EditBill({
    Key? key,
    required this.database,
    this.bill,
  }) : super(key: key);
  @override
  _EditBillState createState() => _EditBillState();
}

class _EditBillState extends State<EditBill> {
  double? _amount;
  String? _customerPhoneNumber;
  String? _description;
  String? _otp;
  String? _documentId;
  int? _rewardPointsGiven;
  int? _redeemRewardPoints;
  bool _isProcessing = true;
  bool _isShopActive = false;
  bool _isLoading = false;
  bool? _doYouWantToReedeem = false;
  FocusNode _amountFocusNode = FocusNode();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _rewardGivenController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _redeemRewardPointsController = TextEditingController();

  TextEditingController _customerPhoneNumberController =
      TextEditingController();

  FocusNode _customerPhoneNumberFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    //_redeemRewardPointsController.text = 0.toString();
    if (widget.bill != null) {
      _amount = widget.bill!.amount == null ? '' as double? : widget.bill!.amount;
      _amountController.text = widget.bill!.amount.toString();
      _rewardGivenController.text = widget.bill!.rewardPointsGiven.toString();
      _customerPhoneNumberController.text =
          widget.bill!.customerPhoneNumber == null
              ? ''
              : widget.bill!.customerPhoneNumber!.contains('+91')
                  ? widget.bill!.customerPhoneNumber!.substring(3)
                  : widget.bill!.customerPhoneNumber!;
      _descriptionController.text =
          widget.bill!.description == null ? '' : widget.bill!.description!;
      _documentId = widget.bill!.documentId;
    }
    super.initState();
  }

  void _onFormSubmit(database) async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      print('_customerPhoneNumberController');
      print(_customerPhoneNumberController.text);
      _customerPhoneNumber = '+91' + _customerPhoneNumberController.text;
      Bill bill = Bill(
        rewardPointsGiven: int.parse(_rewardGivenController.text),
        amount: _amount,
        customerPhoneNumber: _customerPhoneNumber,
        isProcessing: _isProcessing,
        redeemRewardPoints: _redeemRewardPointsController.text != ""
            ? int.parse(_redeemRewardPointsController.text)
            : null,
        otp: _otp,
        description: _descriptionController.text,
      );
      if (_documentId == null)
        database.createBill(
            model: bill, shopDocumentId: database.loggedInUser.shopDocumentId);
      else {
        bill = bill.copyWith(
          customerUID: widget.bill!.customerUID,
        );
        database.updateBill(model: bill, documentId: _documentId);
      }
      Navigator.pop(context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var database = widget.database;
    if (database == null)
      database = Provider.of<FirestoreDatabase>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Bill'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: CustomCard(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                StreamBuilder<List<User>>(
                    stream: database.usersStream(
                        q: (q) => q.where('phoneNumber',
                            isEqualTo:
                                '+91' + _customerPhoneNumberController.text)),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active &&
                          snapshot.hasData &&
                          snapshot.data!.length > 0) {
                        return Text(
                          snapshot?.data?.first?.name!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
                SizedBox(
                  height: 30,
                ),
                _buildPhoneNumberInput(database),
                SizedBox(
                  height: 30,
                ),
                StreamBuilder<SettingModel>(
                    initialData: SettingModel(),
                    stream: database.rewardSettingStream(
                        shopDocumentId: database.loggedInUser!.shopDocumentId),
                    builder: (context, snapshot) {
                      return _buildAmountInput(
                          database, snapshot.data?.reward_percentage);
                    }),
                SizedBox(
                  height: 30,
                ),
                _buildRewardPointGivenInput(database),
                SizedBox(
                  height: 30,
                ),
                FormInput(
                  name: 'Description',
                  textFormField: TextFormField(
                    controller: _descriptionController,
                    decoration: FormInput.inputDecoration(),
                    // onChanged: (description) {
                    //   setState(() {
                    //     _descriptionController.text = description;
                    //   });
                    // },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Checkbox(
                    activeColor: Color(0x9800EE14),
                    value: _doYouWantToReedeem,
                    onChanged: (v) {
                      setState(() {
                        _doYouWantToReedeem = v;
                      });
                    }),
                if (_doYouWantToReedeem!)
                  StreamBuilder<List<Customer>>(
                      stream: database.customerStream(
                          q: (q) => q.where('phoneNumber',
                              isEqualTo:
                                  '+91' + _customerPhoneNumberController.text)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.active &&
                            snapshot.hasData &&
                            snapshot.data!.length > 0) {
                          // _redeemRewardPointsController.text =
                          //     snapshot.data?.first?.reward_points.toString();
                          return Column(
                            children: [
                              FormInput(
                                name: 'Available Points',
                                textFormField: TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.all(16.0),
                                      border: OutlineInputBorder()),
                                  initialValue: snapshot
                                      .data?.first?.reward_points
                                      .toString(),
                                  readOnly: true,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              FormInput(
                                name: 'Redeem Reward Points',
                                textFormField: TextFormField(
                                  controller: _redeemRewardPointsController,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.all(16.0),
                                      border: OutlineInputBorder()),
                                  validator: (reedemption) {
                                    return int.parse(reedemption!) >
                                            snapshot.data?.first?.reward_points!
                                        ? "Enter points less then ${snapshot.data?.first?.reward_points}"
                                        : null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              FormInput(
                                name: 'otp',
                                textFormField: TextFormField(
                                  maxLength: 4,
                                  decoration: FormInput.inputDecoration(),
                                  onChanged: (v) {
                                    _otp = v;
                                  },
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  onPressed: () => _onFormSubmit(database),
                  color: Colors.greenAccent,
                  child: Text('Submit'),
                ),
              ],
            ))),
      ),
    );
  }

  FormInput _buildPhoneNumberInput(Database database) {
    return FormInput(
      name: 'Customer Phone Number',
      textFormField: TextFormField(
        maxLength: 10,
        minLines: 1,
        autofocus: true,
        controller: _customerPhoneNumberController,
        focusNode: _customerPhoneNumberFocusNode,
        validator: (v) {
          if (v!.length < 10)
            return "Please Enter Correct Number";
          else
            return null;
        },
        onEditingComplete: () {
          if (nameValidator(_customerPhoneNumberController.text) == null)
            FocusScope.of(context).requestFocus(_amountFocusNode);
        },
        onChanged: (customerPhoneNumber) {
          if (customerPhoneNumber.length == 10)
            setState(() {
              _customerPhoneNumber = customerPhoneNumber;
            });
        },
        textInputAction: TextInputAction.next,
        decoration: FormInput.inputDecoration(),
      ),
    );
  }

  FormInput _buildAmountInput(database, reward_percentage) {
    return FormInput(
      name: 'Amount',
      textFormField: TextFormField(
        // initialValue: _amount != null ? _amount : '',
        controller: _amountController,
        keyboardType: TextInputType.text,
        decoration: FormInput.inputDecoration(),
        autofocus: false,
        focusNode: _amountFocusNode,
        textInputAction: TextInputAction.done,
        validator: nameValidator,
        onChanged: (amount) {
          setState(() {
            _amount = double.parse(amount);
            _rewardPointsGiven = int.parse(
                (_amount! * (reward_percentage / 100)).floor().toString());
            _rewardGivenController.text = _rewardPointsGiven.toString();
          });
        },
        onEditingComplete: () => _onFormSubmit(database),

        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }

  FormInput _buildRewardPointGivenInput(database) {
    return FormInput(
      name: 'Reward Point Given',
      textFormField: TextFormField(
        // initialValue: _amount != null ? _amount : '',
        controller: _rewardGivenController,
        keyboardType: TextInputType.text,
        decoration: FormInput.inputDecoration(),
        autofocus: false,
        validator: nameValidator,
        onChanged: (rewardPoints) {
          setState(() {
            _rewardPointsGiven = int.parse(rewardPoints);
          });
        },
        onEditingComplete: () => _onFormSubmit(database),

        inputFormatters: [
          FilteringTextInputFormatter.singleLineFormatter,
        ],
      ),
    );
  }

  String? nameValidator(String? v) {
    return null;
  }
}
