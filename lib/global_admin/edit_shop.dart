import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kretaa/common_widgets/custom_card.dart';
import 'package:kretaa/common_widgets/form_input.dart';
import 'package:kretaa/model/shop.dart';
import 'package:kretaa/services/database.dart';
import 'package:provider/provider.dart';

class EditShop extends StatefulWidget {
  final Database database;
  final Shop shop;
  const EditShop({
    Key key,
    @required this.database,
    this.shop,
  }) : super(key: key);
  @override
  _EditShopState createState() => _EditShopState();
}

class _EditShopState extends State<EditShop> {
  String _shopName;
  String _ownerName;
  String _ownerPhoneNumber;
  String _documentId;
  bool _isProcessing = true;
  bool _isShopActive = false;
  bool _isLoading = false;
  TextEditingController _shopNameController = TextEditingController();
  FocusNode _shopNameFocus = FocusNode();
  FocusNode _ownerNameFocus = FocusNode();
  FocusNode _ownerPhoneNumberFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.shop != null) {
      _shopName = widget.shop.shopName == null ? '' : widget.shop.shopName;
      _ownerName = widget.shop.ownerName == null ? '' : widget.shop.ownerName;
      _ownerPhoneNumber = widget.shop.ownerPhoneNumber == null
          ? ''
          : widget.shop.ownerPhoneNumber.contains('+91')
              ? widget.shop.ownerPhoneNumber.substring(3)
              : widget.shop.ownerPhoneNumber;
      _shopNameController.text = widget.shop.shopName;
      _documentId = widget.shop.documentId;
      _isShopActive = widget.shop.isShopActive;
    }
    super.initState();
  }

  void _onFormSubmit(database) {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState.validate()) {
      _ownerPhoneNumber = '+91' + _ownerPhoneNumber;
      Shop shop = Shop(
          shopName: _shopName,
          ownerName: _ownerName,
          ownerPhoneNumber: _ownerPhoneNumber,
          isShopActive: _isShopActive,
          isProcessing: _isProcessing);
      // shop.copyWith(state: 'processing');
      if (_documentId == null)
        database.createShop(shop: shop);
      else
        database.updateShop(shop: shop, documentId: _documentId);
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
        title: Text('Create Shop'),
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
                Text(
                  "Enter Shop Details",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                buildShopNameInput(),
                SizedBox(
                  height: 30,
                ),
                buildOwnerNameInput(),
                SizedBox(
                  height: 30,
                ),
                buildPhoneNumberInput(database),
                Checkbox(
                  activeColor: Colors.green,
                  onChanged: (v) {
                    setState(() {
                      _isShopActive = v;
                    });
                  },
                  value: _isShopActive ?? false,
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

  FormInput buildPhoneNumberInput(Database database) {
    return FormInput(
      name: 'Owner Phone Number',
      textFormField: TextFormField(
        initialValue: _ownerPhoneNumber != null ? _ownerPhoneNumber : '',
        maxLength: 10,
        minLines: 1,
        // autofocus: true,
        focusNode: _ownerPhoneNumberFocus,
        validator: (v) {
          if (v.length < 10)
            return "Please Enter Correct Number";
          else
            return null;
        },
        onChanged: (ownerPhoneNumber) {
          setState(() {
            _ownerPhoneNumber = ownerPhoneNumber;
          });
        },
        textInputAction: TextInputAction.done,
        onEditingComplete: () => _onFormSubmit(database),
        decoration: FormInput.inputDecoration(),
      ),
    );
  }

  FormInput buildOwnerNameInput() {
    return FormInput(
      name: 'Owner Name',
      textFormField: TextFormField(
        initialValue: _ownerName != null ? _ownerName : '',
        keyboardType: TextInputType.text,
        decoration: FormInput.inputDecoration(),
        focusNode: _ownerNameFocus,
        onChanged: (ownerName) {
          setState(() {
            _ownerName = ownerName;
          });
        },
        inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      ),
    );
  }

  FormInput buildShopNameInput() {
    return FormInput(
      name: 'Shop Name',
      textFormField: TextFormField(
        // initialValue: _shopName != null ? _shopName : '',
        controller: _shopNameController,
        keyboardType: TextInputType.text,
        decoration: FormInput.inputDecoration(),
        autofocus: true,
        focusNode: _shopNameFocus,
        textInputAction: TextInputAction.next,
        validator: nameValidator,
        onEditingComplete: () {
          if (nameValidator(_shopNameController.text) == null)
            FocusScope.of(context).requestFocus(_ownerNameFocus);
        },
        onChanged: (shopName) {
          setState(() {
            _shopName = shopName;
          });
        },
        inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      ),
    );
  }

  String nameValidator(String v) {
    return null;
  }
}
