import 'package:flutter/material.dart';
import 'package:kretaa/model/item.dart';
import 'package:meta/meta.dart';

class BillNotifier with ChangeNotifier {
  String? documentId;
  String? description;
  List<ItemNotifier>? item;
  int? id;
  int? rewardPointsGiven;
  int? redeemRewardPoints;
  bool? isProcessing;
  String? customerPhoneNumber;
  double? amount;
  String? updatedByUID;
  String? customerUID;
  dynamic updatedOn;
  String? shopDocumentId;
  String? otp;
  String? error;
  BillNotifier(
      {this.documentId,
      this.id,
      this.description,
      this.error,
      this.amount = 0,
      this.isProcessing = true,
      this.customerPhoneNumber,
      this.updatedByUID,
      this.customerUID,
      this.updatedOn,
      this.rewardPointsGiven,
      this.redeemRewardPoints,
      this.shopDocumentId,
      this.item,
      this.otp});
  Map<String, dynamic> toMap() {
    print('Item new = $item');
    List<Map<String, dynamic>> itemMap = List<Map<String, dynamic>>();
    for (var i = 0; i < item!.length; i++) {
      print('itemr i = ${item![i].toMap()}');
      itemMap.add(item![i].toMap());
    }

    var x = {
      'description': description,
      'error': error,
      'amount': amount,
      'updatedByUID': updatedByUID,
      'customerUID': customerUID,
      'updatedOn': updatedOn,
      'customerPhoneNumber': customerPhoneNumber,
      'isProcessing': isProcessing,
      'rewardPointsGiven': rewardPointsGiven,
      'redeemRewardPoints': redeemRewardPoints,
      'shopDocumentId': shopDocumentId,
      'otp': otp,
      'item': itemMap
    };
    print('x= $x');
    return x;
  }

  factory BillNotifier.fromMap(
      Map<String, dynamic> data, String documentId, String path) {
    print('bill data = $data');
    print('Path = $path');
    List<ItemNotifier> itemObject = List<ItemNotifier>();
    if (data['item'] != null && data['item'].length > 0)
      for (var i = 0; i < data['item'].length; i++) {
        itemObject.add(ItemNotifier.fromMap(data['item'][i]));
      }

    int? id = data['id'];
    String? description = data['description'];
    String? error = data['error'];
    double? amount = data['amount'];
    bool? isProcessing = data['isProcessing'];
    String? customerPhoneNumber = data['customerPhoneNumber'];
    String? updatedByUID = data['updatedByUID'];
    String? customerUID = data['customerUID'];
    int? rewardPointsGiven = data['rewardPointsGiven'];
    int? redeemRewardPoints = data['redeemRewardPoints'];
    dynamic updatedOn = data['updatedOn'];
    List<ItemNotifier> item = itemObject;
    final shopDocumentId = path.split('/')[1];

    BillNotifier bill = BillNotifier(
      documentId: documentId,
      id: id,
      description: description,
      error: error,
      updatedByUID: updatedByUID,
      customerUID: customerUID,
      updatedOn: updatedOn,
      customerPhoneNumber: customerPhoneNumber,
      amount: amount,
      isProcessing: isProcessing,
      rewardPointsGiven: rewardPointsGiven,
      redeemRewardPoints: redeemRewardPoints,
      shopDocumentId: shopDocumentId,
      item: item,
    );
    print(bill.updatedOn.runtimeType);
    return bill;
  }

  BillNotifier copyWith(
      {String? documentId,
      String? description,
      String? error,
      String? id,
      double? amount,
      String? isProcessing,
      String? updatedByUID,
      String? customerPhoneNumber,
      String? customerUID,
      dynamic updatedOn,
      int? rewardPointsGiven,
      int? redeemRewardPoints,
      String? shopId,
      String? otp,
      List<ItemNotifier>? item}) {
    return BillNotifier(
        documentId: documentId ?? this.documentId,
        description: description ?? this.description,
        error: error ?? this.error,
        id: id as int? ?? this.id,
        isProcessing: isProcessing as bool? ?? this.isProcessing,
        amount: amount ?? this.amount,
        updatedByUID: updatedByUID ?? this.updatedByUID,
        customerUID: customerUID ?? this.customerUID,
        updatedOn: updatedOn ?? this.updatedOn,
        customerPhoneNumber: customerPhoneNumber ?? this.customerPhoneNumber,
        rewardPointsGiven: rewardPointsGiven ?? this.rewardPointsGiven,
        redeemRewardPoints: redeemRewardPoints ?? this.redeemRewardPoints,
        shopDocumentId: shopId ?? this.shopDocumentId,
        otp: otp ?? this.otp,
        item: item ?? this.item);
  }

  void updateWith(
      {String? documentId,
      String? description,
      String? error,
      String? id,
      double? amount,
      String? isProcessing,
      String? updatedByUID,
      String? customerPhoneNumber,
      String? customerUID,
      dynamic updatedOn,
      int? rewardPointsGiven,
      int? redeemRewardPoints,
      String? shopId,
      String? otp,
      List<ItemNotifier>? item}) {
    this.documentId = documentId ?? this.documentId;
    this.description = description ?? this.description;
    this.error = error ?? this.error;
    this.id = id as int? ?? this.id;
    this.isProcessing = isProcessing as bool? ?? this.isProcessing;
    this.amount = amount ?? this.amount;
    this.updatedByUID = updatedByUID ?? this.updatedByUID;
    this.customerUID = customerUID ?? this.customerUID;
    this.updatedOn = updatedOn ?? this.updatedOn;
    this.customerPhoneNumber = customerPhoneNumber ?? this.customerPhoneNumber;
    this.rewardPointsGiven = rewardPointsGiven ?? this.rewardPointsGiven;
    this.redeemRewardPoints = redeemRewardPoints ?? this.redeemRewardPoints;
    this.shopDocumentId = shopId ?? this.shopDocumentId;
    this.otp = otp ?? this.otp;
    this.item = item ?? this.item;
    notifyListeners();
  }

  @override
  String toString() =>
      'id: $id, amount: $amount, updatedByUID: $updatedByUID,isProcessing:$isProcessing';
}
