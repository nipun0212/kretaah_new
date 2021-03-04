import 'package:kretaa/model/item.dart';
import 'package:meta/meta.dart';

class Bill {
  final String? documentId;
  final String? description;
  final int? id;
  final int? rewardPointsGiven;
  final int? redeemRewardPoints;
  final bool? isProcessing;
  final String? customerPhoneNumber;
  final double? amount;
  final String? updatedByUID;
  final String? customerUID;
  final dynamic updatedOn;
  final String? shopDocumentId;
  final String? otp;
  final List<ItemNotifier>? item;

  Bill(
      {this.documentId,
      this.id,
      this.description,
      required this.amount,
      required this.isProcessing,
      required this.customerPhoneNumber,
      this.item,
      this.updatedByUID,
      this.customerUID,
      this.updatedOn,
      this.rewardPointsGiven,
      this.redeemRewardPoints,
      this.shopDocumentId,
      this.otp});

  Map<String, dynamic> toMap() {
    print('Item new = $item');
    List<Map<String, dynamic>> itemMap = List<Map<String, dynamic>>();
    for (var i = 0; i < item!.length; i++) {
      print('itemr i = ${item![i].toMap()}');
      itemMap.add(item![i].toMap());
    }
    return {
      'description': description,
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
  }

  factory Bill.fromMap(
      Map<String, dynamic> data, String documentId, String path) {
    print('bill data = $data');
    print('Path = $path');
    List<ItemNotifier> itemObject = List<ItemNotifier>();
    if (data['item'] != null && data['item'].length > 0)
      for (var i = 0; i < data['item'].length; i++) {
        itemObject.add(ItemNotifier.fromMap(data['item'][i]));
      }
    final int? id = data['id'];
    final String? description = data['description'];
    final double? amount = data['amount'];
    final bool? isProcessing = data['isProcessing'];
    final String? customerPhoneNumber = data['customerPhoneNumber'];
    final String? updatedByUID = data['updatedByUID'];
    final String? customerUID = data['customerUID'];
    final int? rewardPointsGiven = data['rewardPointsGiven'];
    final int? redeemRewardPoints = data['redeemRewardPoints'];
    final dynamic updatedOn = data['updatedOn'];
    final List<ItemNotifier> item = itemObject;
    final shopDocumentId = path.split('/')[1];

    Bill bill = Bill(
      documentId: documentId,
      id: id,
      description: description,
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

  Bill copyWith(
      {String? documentId,
      String? description,
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
    return Bill(
        documentId: documentId ?? this.documentId,
        description: description ?? this.description,
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

  @override
  String toString() =>
      'id: $id, amount: $amount, updatedByUID: $updatedByUID,isProcessing:$isProcessing';
}
