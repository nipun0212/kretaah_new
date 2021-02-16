import 'package:flutter/foundation.dart';
import 'package:kretaa/model/bill_notifier.dart';
import 'package:kretaa/model/gst.dart';
import 'package:kretaa/model/item.dart';
import 'package:kretaa/model/setting_doc.dart';
import 'package:kretaa/services/database.dart';
import 'package:kretaa/shop_admin/state/setting_model.dart';
import 'package:kretaa/shop_admin/state/setting_state.dart';

class ValidationItem {
  final String value;
  final String error;

  ValidationItem({this.value, this.error});
}

class EditBillModel with ChangeNotifier {
  ValidationItem _phoneNumberValidation = ValidationItem();
  List<ValidationItem> _itemNameValidation = List<ValidationItem>();
  ValidationItem get phoneNumberValidation => _phoneNumberValidation;
  List<ValidationItem> get itemNameValidation => _itemNameValidation;
  final Database database;
  BillNotifier bill;
  String otp;
  int rewardPercentage;
  String default_gst_setting;
  bool gstIncluded;
  Map<String, int> gstoptions;
  EditBillModel(
      {@required this.database,
      this.bill,
      this.rewardPercentage,
      this.otp,
      this.gstoptions,
      this.gstIncluded = true});

  void updateWith(
      {String documentId,
      String description,
      double amount,
      String customerPhoneNumber,
      int rewardPointsGiven,
      int redeemRewardPoints,
      int rewardPercentage,
      String otp,
      bool gstIncluded,
      String default_gst_setting,
      List<ItemNotifier> item}) {
    this.bill.documentId = documentId ?? this.bill.documentId;
    this.bill.description = description ?? this.bill.description;
    this.bill.amount = amount ?? this.bill.amount;
    this.bill.customerPhoneNumber =
        customerPhoneNumber ?? this.bill.customerPhoneNumber;
    this.bill.rewardPointsGiven =
        rewardPointsGiven ?? this.bill.rewardPointsGiven;
    this.bill.redeemRewardPoints =
        redeemRewardPoints ?? this.bill.redeemRewardPoints;
    this.otp = otp ?? this.otp;
    this.bill.item = item ?? this.bill.item;
    this.rewardPercentage = rewardPercentage ?? this.rewardPercentage;
    this.gstIncluded = gstIncluded ?? this.gstIncluded;
    this.default_gst_setting = default_gst_setting ?? this.default_gst_setting;
    if (item == null) updateAllItem();
    notifyListeners();
  }

  void updateAllItem() {
    for (int i = 0; i < bill.item.length; i++) {
      updateItem(index: i);
    }
  }

  void changePhoneNumber(String value) {
    if (value.length == 10) {
      _phoneNumberValidation = ValidationItem(value: value, error: null);
    } else {
      _phoneNumberValidation =
          ValidationItem(value: null, error: "Must be 10 characters");
    }
    notifyListeners();
  }

  updateItem({
    @required int index,
    String name,
    String description,
    double rate,
    int quantity,
    int gst_percentage,
  }) {
    ItemNotifier item = this.bill.item[index];
    item.name = name ?? item.name;
    item.description = description ?? item.description;
    item.rate = rate ?? item.rate;
    item.quantity = quantity ?? item.quantity;
    item.gst_percentage = gst_percentage ?? item.gst_percentage;

    double itemTotal = (item.quantity * item.rate);
    int gstRate = item.gst_percentage;
    double gstTax = 0.0;
    if (this.gstIncluded) {
      gstTax = itemTotal -
          (itemTotal *
              double.parse((100 / (100 + gstRate)).toStringAsFixed(2)));
      item.rateAfterGST = double.parse(
          ((itemTotal - gstTax) / item.quantity).toStringAsFixed(2));
    } else {
      gstTax = itemTotal * gstRate / 100;
      item.rateAfterGST = item.rate;
    }
    item.cgst = gstTax / 2;
    item.sgst = gstTax / 2;
    item.totalGST = gstTax;
    item.totalAmount = item.rateAfterGST * item.quantity + gstTax;
    this.bill.item[index] = item;
    notifyListeners();
  }

  void addItem() {
    if (this.bill.item == null) this.bill.item = List<ItemNotifier>();
    this.bill.item.add(
        ItemNotifier(gst_percentage: gstoptions[default_gst_setting] ?? 0));
    notifyListeners();
  }

  Future<int> setRewardPoints() async {
    this.gstoptions = Gst().gst_options;
    SettingModel rewardSettingStream = await database
        .rewardSettingStream(
            shopDocumentId: database.loggedInUser.shopDocumentId)
        .first;

    int rewardPercentage = rewardSettingStream.reward_percentage;
    String default_gst_setting = rewardSettingStream.default_gst_setting;
    updateWith(
        rewardPercentage: rewardPercentage,
        default_gst_setting: default_gst_setting);
    return rewardPercentage;
  }
}
