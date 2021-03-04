import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kretaa/common_widgets/custom_card.dart';
import 'package:kretaa/common_widgets/form_input.dart';
import 'package:kretaa/model/bill.dart';
import 'package:kretaa/model/bill_notifier.dart';
import 'package:kretaa/model/customer.dart';
import 'package:kretaa/model/item.dart';
import 'package:kretaa/model/item.dart';
import 'package:kretaa/model/user.dart';
import 'package:kretaa/model/setting_doc.dart';
import 'package:kretaa/services/database.dart';
import 'package:kretaa/shop_admin/bills/edit_bill_model.dart';
import 'package:kretaa/shop_admin/state/bill_freezed_model.dart';
import 'package:kretaa/shop_admin/state/gst_state.dart';
import 'package:kretaa/util/util.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class EditBillNotifier extends StatefulWidget {
  final Database database;
  // final BillNotifier bill;
  final EditBillModel model;
  final EditBillModel previousModel;
  const EditBillNotifier(
      {@required this.model, @required this.database, this.previousModel
      // this.bill,
      });
  static Widget create(BuildContext context, BillNotifier m) {
    // print('amount= ${m.amount}');
    // print('m=$m');
    final database = Provider.of<Database>(context, listen: false);
    return ChangeNotifierProvider<EditBillModel>(
      create: (_) =>
          EditBillModel(database: database, bill: m ?? BillNotifier()),
      child: Consumer<EditBillModel>(
        builder: (_, model, __) {
          // if (m != null) {
          //   model = m;
          //   m = null;
          // }
          print('model= $model');
          print('m =$m');
          return EditBillNotifier(
            model: model,
            database: database,
          );
        },
      ),
    );
  }

  @override
  _EditBillNotifierState createState() => _EditBillNotifierState();
}

class _EditBillNotifierState extends State<EditBillNotifier> {
  EditBillModel model;
  int rewardPercentabe;
  double _amount;
  String _customerPhoneNumber;
  String _description;
  String _otp;
  String _documentId;
  int _rewardPointsGiven;
  int _redeemRewardPoints;
  bool _isProcessing = true;
  bool _isShopActive = false;
  bool _isLoading = false;
  bool _doYouWantToReedeem = false;

  FocusNode _amountFocusNode = FocusNode();
  TextEditingController _amountController = TextEditingController();
  List<TextEditingController> _itemNameController =
      List<TextEditingController>();
  List<TextEditingController> _itemRateController =
      List<TextEditingController>();
  List<TextEditingController> _itemQuantityController =
      List<TextEditingController>();
  List<TextEditingController> _itemGSTController =
      List<TextEditingController>();

  TextEditingController _rewardGivenController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _redeemRewardPointsController = TextEditingController();

  TextEditingController _customerPhoneNumberController =
      TextEditingController();

  FocusNode _customerPhoneNumberFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  //  @override
  // void dispose() {
  //   _itemNameController[].dispose();
  //   super.dispose();
  // }

  @override
  void initState() {
    model = widget.model;
    if (model.bill.documentId != null) {
      _customerPhoneNumberController.text =
          Util.getPhoneNumberWithoutCountryCode(model.bill.customerPhoneNumber);

      for (int i = 0; i < model.bill.item.length; i++) {
        var item = model.bill.item[i];
        _itemNameController.add(TextEditingController(text: item.name));
        _itemRateController
            .add(TextEditingController(text: item.rate.toString()));
        _itemQuantityController
            .add(TextEditingController(text: item.quantity.toString()));
        _itemGSTController
            .add(TextEditingController(text: item.gst_percentage.toString()));
      }
    } else {
      _itemNameController.add(TextEditingController());
      _itemRateController.add(TextEditingController());
      _itemQuantityController.add(TextEditingController(text: 1.toString()));
      _itemGSTController.add(TextEditingController());
    }
    // loadIntialData();
    if (widget.previousModel != null) {
      model.updateWith();
    }
    // _redeemRewardPointsController.text = 0.toString();
    super.initState();
  }

  // void loadIntialData() async {
  //   // widget.bill.addItem();
  //   await model.setRewardPoints();
  //   // await model.setGST();
  //   // print('bill reqae= ${await widget.bill.setRewardPoint()}');
  // }

  // @override
  // Widget build(BuildContext context) {
  //   // print(model.amount);
  //   // print(model.amount);
  //   // final md = Provider.of<EditBillModel>(context);
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: Text('nipu'),
  //       ),
  //       body: GestureDetector(
  //           onTap: () {
  //             print('clicl');
  //             model.updateWith(amount: (model.amount + 10));
  //             // print(model.amount);
  //           },
  //           child: Text(model.amount.toString())));
  //   // Text(model.rewardPointGiven.toString());
  // }
  void _onFormSubmit(Database database) async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState.validate()) {
      print('_customerPhoneNumberController');
      print(_customerPhoneNumberController.text);
      // _customerPhoneNumber = '+91' + _customerPhoneNumberController.text;
      // BillNotifier bill = BillNotifier(
      //   rewardPointsGiven: int.parse(_rewardGivenController.text),
      //   amount: _amount,
      //   customerPhoneNumber: _customerPhoneNumber,
      //   isProcessing: _isProcessing,
      //   redeemRewardPoints: _redeemRewardPointsController.text != ""
      //       ? int.parse(_redeemRewardPointsController.text)
      //       : null,
      //   otp: _otp,
      //   description: _descriptionController.text,
      //   item: model.bill.item,
      //   // item: [
      //   //   ItemNotifier(
      //   //       description: 'dwds',
      //   //       amount: 12.3,
      //   //       cgst: 32.2,
      //   //       itemName: 'dsd',
      //   //       sgst: 23),
      //   //   ItemNotifier(
      //   //       description: 'dwceds',
      //   //       amount: 25,
      //   //       cgst: 3223,
      //   //       itemName: 'dfdcdwseds',
      //   //       sgst: 10),
      //   // ],
      // );
      model.bill = model.bill.copyWith(
          customerPhoneNumber:
              Util.parsePhoneNumber(model.bill.customerPhoneNumber));
      if (model.bill.documentId == null)
        database.createBill(
            bill: model.bill,
            shopDocumentId: database.loggedInUser.shopDocumentId);
      else {
        // print('bill= $bill');
        model.bill = model.bill.copyWith(
          customerUID: model.bill.customerUID,
        );

        database.updateBill(
            bill: model.bill,
            documentId: model.bill.documentId,
            shopDocumentId: database.loggedInUser.shopDocumentId);
      }
      Navigator.pop(context);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (model.bill.item == null) {
        await model.setRewardPoints();
        model.addItem();
      }
    });
    var database = widget.database;
    if (database == null)
      database = Provider.of<FirestoreDatabase>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Create BillNotifier'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: CustomCard(
                child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (_customerPhoneNumberController.text.length == 10)
                  _showUserDetails(database),
                SizedBox(
                  height: 30,
                ),
                _buildPhoneNumberInput(database),
                // SizedBox(
                //   height: 30,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('GST Included'),
                    Switch(
                      value: model.gstIncluded,
                      onChanged: (status) {
                        model.updateWith(gstIncluded: status);
                      },
                    ),
                  ],
                ),
                if (model.bill.item != null)
                  for (var i = 0; i < model.bill.item.length; i++)
                    _buildItemInput(database, i),
                RaisedButton(
                    child: Text('Add Item'),
                    onPressed: () {
                      _itemRateController.add(TextEditingController());
                      _itemNameController.add(TextEditingController());
                      _itemQuantityController
                          .add(TextEditingController(text: 1.toString()));
                      _itemGSTController.add(TextEditingController());

                      // widget.bill
                      //     .updateWith(itemCount: widget.bill.itemCount + 1);
                      model.addItem();
                    }),
                SizedBox(
                  height: 30,
                ),
                _buildAmountInput(database),
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
                    onChanged: (description) {
                      model.updateWith(description: description);
                    },
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
                if (_doYouWantToReedeem)
                  StreamBuilder<List<Customer>>(
                      stream: database.customerStream(
                          q: (q) => q.where('phoneNumber',
                              isEqualTo:
                                  '+91' + _customerPhoneNumberController.text)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.active &&
                            snapshot.hasData &&
                            snapshot.data.length > 0) {
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
                                    return int.parse(reedemption) >
                                            snapshot.data?.first?.reward_points
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

  StreamBuilder<List<User>> _showUserDetails(Database database) {
    return StreamBuilder<List<User>>(
        stream: database.usersStream(
            q: (q) => q.where('phoneNumber',
                isEqualTo: '+91' + _customerPhoneNumberController.text)),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active)
            return Center(child: CircularProgressIndicator());
          if (!snapshot.hasData || snapshot.data.length <= 0)
            return Text('No data');
          return Column(
            children: [
              Text(
                snapshot?.data?.first?.name ?? '',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                snapshot?.data?.first?.phoneNumber,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        });
  }

  FormInput _buildPhoneNumberInput(Database database) {
    // final validationService = Provider.of(context);

    return FormInput(
      name: 'Customer Phone Number',
      textFormField: TextFormField(
        maxLength: 10,
        minLines: 1,
        autofocus: true,
        controller: _customerPhoneNumberController,
        focusNode: _customerPhoneNumberFocusNode,

        // validator: (v) {

        //   // if (v.length < 10)
        //   //   return "Please Enter Correct Number";
        //   // else
        //   //   return null;
        // },
        onEditingComplete: () {
          if (nameValidator(_customerPhoneNumberController.text) == null)
            FocusScope.of(context).requestFocus(_amountFocusNode);
        },
        onChanged: (customerPhoneNumber) {
          model.changePhoneNumber(customerPhoneNumber);
          if (customerPhoneNumber.length == 10)
            model.updateWith(customerPhoneNumber: customerPhoneNumber);
        },
        textInputAction: TextInputAction.next,
        decoration: FormInput.inputDecoration(
            // errorText: widget.bill.bill.item[index].error
            ),
      ),
    );
  }

  Widget _buildItemInput(database, index) {
    return Slidable(
      key: ObjectKey(model.bill.item[index]),
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: <Widget>[
        IconSlideAction(
            caption: 'Delete',
            closeOnTap: false,
            color: Colors.red,
            icon: Icons.more_horiz,
            onTap: () {
              if (model.bill.item.length == 1) return;
              if (_itemNameController.length > index) {
                // _itemNameController[index].dispose();
                _itemNameController.removeAt(index);
              }
              if (_itemNameController.length > index) {
                // _itemRateController[index].dispose();
                _itemRateController.removeAt(index);
              }
              if (_itemNameController.length > index) {
                // _itemQuantityController[index].dispose();
                _itemQuantityController.removeAt(index);
              }
              if (_itemNameController.length > index) {
                // _itemGSTController[index].dispose();
                _itemGSTController.removeAt(index);
              }
              model.bill.item.removeAt(index);
              model.updateWith();
            })
      ],
      child: PhysicalModel(
        color: Colors.white,
        shadowColor: Colors.purple,
        elevation: 10.0,
        child: Card(
          key: Key(index.toString()),
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: FormInput(
                      name: 'Item Name',
                      textFormField: TextFormField(
                        // initialValue: _amount != null ? _amount : '',
                        controller: _itemNameController[index],
                        keyboardType: TextInputType.text,
                        decoration: FormInput.inputDecoration(),
                        autofocus: false,
                        textInputAction: TextInputAction.done,
                        validator: nameValidator,
                        onChanged: (itemName) {
                          model.updateItem(name: itemName, index: index);

                          // item = widget.bill.item[index].itemName;
                          // List<ItemNotifier> itemTemp = widget.bill.item;
                          // if (itemTemp == null) {
                          //   itemTemp = List<ItemNotifier>();
                          //   itemTemp.add(ItemNotifier(itemName: itemName));
                          // }
                          // if (itemTemp.length < index + 1)
                          //   itemTemp.add(ItemNotifier(itemName: itemName));
                          // print(itemTemp);
                          // itemTemp[index].itemName = itemName;
                          // widget.bill.updateWith(item: itemTemp);
                          // print(widget.bill.item);
                        },
                        onEditingComplete: () => _onFormSubmit(database),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: FormInput(
                      name: 'Item Quantity',
                      textFormField: TextFormField(
                        controller: _itemQuantityController[index],
                        keyboardType: TextInputType.number,
                        decoration: FormInput.inputDecoration(),
                        autofocus: false,
                        textInputAction: TextInputAction.done,
                        validator: nameValidator,
                        onChanged: (quantity) {
                          if (quantity.isNotEmpty) {
                            model.bill.item[index].quantity =
                                double.parse(quantity);
                            model.updateItem(
                                quantity: double.parse(quantity), index: index);
                          }

                          // List<ItemNotifier> itemTemp = widget.bill.item;
                          // if (itemTemp == null) {
                          //   itemTemp = List<ItemNotifier>();
                          //   itemTemp
                          //       .add(ItemNotifier(rate: double.parse(rate)));
                          // }
                          // if (itemTemp.length < index + 1)
                          //   itemTemp
                          //       .add(ItemNotifier(rate: double.parse(rate)));
                          // print(itemTemp);
                          // itemTemp[index].rate = double.parse(rate);
                          // widget.bill.updateWith(item: itemTemp);
                          // print(widget.bill.item);
                        },
                        onEditingComplete: () => _onFormSubmit(database),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FormInput(
                      name: 'Item Rate',
                      textFormField: TextFormField(
                        // initialValue: _amount != null ? _amount : '',
                        controller: _itemRateController[index],
                        keyboardType: TextInputType.text,
                        decoration: FormInput.inputDecoration(),
                        autofocus: false,
                        textInputAction: TextInputAction.done,
                        validator: nameValidator,
                        onChanged: (rate) {
                          // model.item[index].rate = double.parse(rate);
                          model.updateItem(
                              rate: double.parse(rate), index: index);
                          // widget.bill.item[index].totalAmount =
                          //     double.parse(rate) *
                          //         widget.bill.item[index].quantity;
                          // widget.bill.updateWith();
                        },
                        onEditingComplete: () => _onFormSubmit(database),
                      ),
                    ),
                  ),

                  //               var menuItems = languages.entries
                  // .map((mapEntry) =>
                  //     DropdownMenuItem(value: mapEntry.key, child: Text(mapEntry.value)))
                  // .toList();
                  DropdownButton(
                      items: model.gstoptions.entries
                          .map((e) => DropdownMenuItem(
                              key: Key(e.key),
                              value: e.value,
                              child: Text(e.key)))
                          .toList(),
                      onChanged: (v) {
                        model.updateItem(index: index, gst_percentage: v);
                      },
                      value: model.bill.item[index].gst_percentage)
                  // DropdownButton<GSTState>(
                  //   value: model.bill.item[index].gst_percentage,
                  //   icon: Icon(Icons.arrow_downward),
                  //   iconSize: 24,
                  //   elevation: 16,
                  //   style: TextStyle(color: Colors.deepPurple),
                  //   underline: Container(
                  //     height: 2,
                  //     color: Colors.deepPurpleAccent,
                  //   ),
                  //   onChanged: (GSTState newValue) {
                  //     model.updateItem(gst_percentage: newValue, index: index);
                  //   },
                  //   items: GSTState.values.map<DropdownMenuItem<GSTState>>((GSTState value) {
                  //     return DropdownMenuItem<GSTState.fromJson(model.database.gst_percentage().toList())>(
                  //       value: value,
                  //       child: Text(value.toString()),
                  //     );
                  //   }).toList(),
                  // ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Text('GST = ${100} '),
                      // Text('CGST = ${100} '),
                      // Text('Total = ${100} '),
                      Text(
                          'Item Rate = ${model.bill.item[index]?.rateAfterGST?.toStringAsFixed(2)} '),
                      Text(
                          'CGST = ${model.bill.item[index].cgst.toStringAsFixed(2)}'),
                      Text(
                          'CGST = ${model.bill.item[index].sgst.toStringAsFixed(2)}'),
                    ],
                  ),
                  Text('Total Amount = ${model.bill.item[index].totalAmount}')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  FormInput _buildAmountInput(database) {
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
          model.updateWith(amount: double.parse(amount));
          model.updateWith(
              rewardPointsGiven:
                  (double.parse(amount) * (model.rewardPercentage / 100))
                      .floor());
          // _amount = double.parse(amount);
          // _rewardPointsGiven = int.parse(
          //     (_amount * (reward_percentage / 100)).floor().toString());
          _rewardGivenController.text = model.bill.rewardPointsGiven.toString();
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
          model.updateWith(rewardPointsGiven: int.parse(rewardPoints));
        },
        onEditingComplete: () => _onFormSubmit(database),

        inputFormatters: [
          FilteringTextInputFormatter.singleLineFormatter,
        ],
      ),
    );
  }

  String nameValidator(String v) {
    return null;
  }
}
