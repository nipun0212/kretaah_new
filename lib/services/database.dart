import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kretaa/model/bill.dart';
import 'package:kretaa/model/bill_notifier.dart';
import 'package:kretaa/model/customer.dart';
import 'package:kretaa/model/gst.dart';
import 'package:kretaa/model/user.dart';
import 'package:kretaa/model/shop.dart';
import 'package:kretaa/services/api_path.dart';
import 'package:kretaa/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kretaa/model/setting_doc.dart';
import 'package:kretaa/shop_admin/state/gst_state.dart';
import 'package:kretaa/shop_admin/state/setting_model.dart';
import 'package:kretaa/shop_admin/state/setting_state.dart';
import 'package:kretaa/shop_admin/state/shop_freezed_model.dart';

abstract class Database {
  User get loggedInUser;
  Future<void> createShop({@required ShopFreezedModel shop});
  Future<void> updateShop(
      {@required ShopFreezedModel shop, @required String documentId});
  Future<void> deleteShop({@required String documentId});
  Stream<User> userStream({@required String uid});
  Stream<List<User>> usersStream({q(Query query)});
  // Stream<FirestoreUser> userStreamByUID({String uid});
  Future<void> updateUser({@required User user});
  Stream<SettingModel> rewardSettingStream({String shopDocumentId});
  Future<void> updateRewardSetting(
      {String shopDocumentId, SettingModel rewardSettingDoc});

  Stream<List<ShopFreezedModel>> shopStream({q(Query query)});
  Stream<ShopFreezedModel> shopDocumentStream({String shopId});
  Stream<List<Bill>> billsStream(
      {q(Query query), bool collectionGroup, String shopDocumentId});
  Stream<List<BillNotifier>> billsStreamNotifier(
      {q(Query query), bool collectionGroup, String shopDocumentId});
  Stream<Bill> billStream({String billDocumentId, String shopDocumentId});
  Stream<BillNotifier> billStreamNotifier(
      {String billDocumentId, String shopDocumentId});

  Stream<List<Customer>> customerCollectionStream({q(Query query)});
  Stream<List<Customer>> customerStream(
      {q(Query query), String shopDocumentId});

  Future<void> createBill(
      {@required BillNotifier bill, @required String shopDocumentId});
  Future<void> updateBill(
      {@required BillNotifier bill,
      @required String documentId,
      @required String shopDocumentId});

  Future<void> deleteBill(
      {@required String documentId, @required String shopDocumentId});

  // Stream<Gst> gst();
}

class FirestoreDatabase extends Database {
  final instance = FirestoreService();

  FirestoreDatabase({@required this.user});
  final User user;

  @override
  User get loggedInUser {
    return user;
  }

  @override
  Stream<SettingModel> rewardSettingStream({String shopDocumentId}) {
    return instance.documentStream(
        path: ApiPath.RewardSetting(shopDocumentId),
        builder: (data, documentId) => SettingModel.fromJson(data));
  }

  Future<void> updateRewardSetting(
      {String shopDocumentId, SettingModel rewardSettingDoc}) {
    return instance.updateDocument(
        path: ApiPath.RewardSetting(shopDocumentId),
        data: rewardSettingDoc.toJson());
  }

  @override
  Future<void> createShop({@required ShopFreezedModel shop}) {
    print(shop.toString());
    return instance.addDocumentToCollection(
        path: ApiPath.Shops(), data: shop.toJson());
  }

  @override
  Future<void> updateShop(
      {@required ShopFreezedModel shop, @required String documentId}) {
    print("shop.toJson()");
    print(shop.toJson());
    return instance.updateDocument(
        path: ApiPath.Shop(documentId), data: shop.toJson());
  }

  @override
  Future<void> deleteShop({@required String documentId}) {
    return instance.deleteDocument(path: ApiPath.Shop(documentId));
  }

  @override
  Stream<List<ShopFreezedModel>> shopStream({q(Query query)}) {
    return instance.collectionStream(
        path: ApiPath.Shops(),
        queryBuilder: q,
        builder: (data, documentId, path) {
          data.update("documentId", (value) => documentId,
              ifAbsent: () => documentId);
          return ShopFreezedModel.fromJson(data);
        });
  }

  @override
  Stream<ShopFreezedModel> shopDocumentStream({String shopId}) {
    print('shopId= $shopId');

    return instance.documentStream(
        path: ApiPath.Shops() + '/' + shopId,
        builder: (data, documentId) {
          data.update("documentId", (value) => documentId,
              ifAbsent: () => documentId);
          return ShopFreezedModel.fromJson(data);
        });
  }

  @override
  Stream<List<Bill>> billsStream(
      {q(Query query), bool collectionGroup = false, String shopDocumentId}) {
    //print('ownerName $shopDocumentId');
    if (collectionGroup) {
      return instance.collectionGroupStream(
          path: 'bills',
          queryBuilder: q,
          builder: (data, documentId, path) =>
              Bill.fromMap(data, documentId, path));
    }
    return instance.collectionStream(
        path: ApiPath.Bills(shopDocumentId: shopDocumentId),
        queryBuilder: q,
        builder: (data, documentId, path) =>
            Bill.fromMap(data, documentId, path));
  }

  @override
  Stream<List<BillNotifier>> billsStreamNotifier(
      {q(Query query), bool collectionGroup = false, String shopDocumentId}) {
    //print('ownerName $shopDocumentId');
    if (collectionGroup) {
      return instance.collectionGroupStream(
          path: 'bills',
          queryBuilder: q,
          builder: (data, documentId, path) =>
              BillNotifier.fromMap(data, documentId, path));
    }
    return instance.collectionStream(
        path: ApiPath.Bills(shopDocumentId: shopDocumentId),
        queryBuilder: q,
        builder: (data, documentId, path) =>
            BillNotifier.fromMap(data, documentId, path));
  }

  @override
  Stream<Bill> billStream({String billDocumentId, String shopDocumentId}) {
    return instance.documentStream(
        path: ApiPath.Bill(
            shopDocumentId: shopDocumentId, billId: billDocumentId),
        builder: (data, documentId) =>
            Bill.fromMap(data, documentId, 'sdcs/dsd'));
  }

  @override
  Stream<BillNotifier> billStreamNotifier(
      {String billDocumentId, String shopDocumentId}) {
    return instance.documentStream(
        path: ApiPath.Bill(
            shopDocumentId: shopDocumentId, billId: billDocumentId),
        builder: (data, documentId) =>
            BillNotifier.fromMap(data, documentId, 'sdcs/dsd'));
  }

  @override
  Future<void> createBill(
      {@required BillNotifier bill, @required String shopDocumentId}) {
    // print(bill.toString());
    // bill = bill.copyWith(updatedByUID: uid);
    // bill['tt'] = [323, 434];
    return instance.addDocumentToCollection(
        path: ApiPath.Bills(
          shopDocumentId: shopDocumentId,
        ),
        data: bill.toMap());
  }

  @override
  Future<void> updateBill(
      {@required BillNotifier bill,
      @required String documentId,
      @required String shopDocumentId}) {
    return instance.updateDocument(
        path: ApiPath.Bill(shopDocumentId: shopDocumentId, billId: documentId),
        data: bill.toMap());
  }

  @override
  Future<void> deleteBill(
      {@required String documentId, @required String shopDocumentId}) {
    return instance.deleteDocument(
        path: ApiPath.Bill(shopDocumentId: shopDocumentId, billId: documentId));
  }

  @override
  Stream<User> userStream({@required String uid}) {
    return instance.documentStream(
        path: ApiPath.user(uid: uid),
        builder: (data, documentId) => User.fromMap(data, documentId));
  }

  @override
  Stream<List<User>> usersStream({q(Query query)}) {
    return instance.collectionStream(
        path: ApiPath.Users(),
        queryBuilder: q,
        builder: (data, documentId, path) => User.fromMap(data, documentId));
  }

  @override
  Future<void> updateUser({User user}) {
    return instance.updateDocument(
      path: ApiPath.user(uid: user.documentId),
      data: user.toMap(),
    );
  }

  @override
  Stream<List<Customer>> customerCollectionStream({q(Query query)}) {
    return instance.collectionGroupStream(
        path: 'customers',
        queryBuilder: q,
        builder: (data, documentId, path) =>
            Customer.fromMap(data, documentId, path));
  }

  @override
  Stream<List<Customer>> customerStream({
    q(Query query),
    String shopDocumentId,
  }) {
    return instance.collectionStream(
        path: ApiPath.Customers(
          shopDocumentId: shopDocumentId,
        ),
        queryBuilder: q,
        builder: (data, documentId, path) =>
            Customer.fromMap(data, documentId, path));
  }

  // @override
  // Stream<Gst> gst() {
  //   return instance.documentStream(
  //       path: ApiPath.GST(),
  //       builder: (data, documentId) => Gst.fromMap(data, documentId));
  // }
}
