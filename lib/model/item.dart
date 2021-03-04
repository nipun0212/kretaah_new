import 'package:flutter/material.dart';
import 'package:kretaa/shop_admin/state/gst_state.dart';
import 'package:meta/meta.dart';

// enum GST { gst_0, gst_5, gst_6, gst_12, gst_28 }

class ItemNotifier with ChangeNotifier {
  String? name;
  String description;
  int? gst_percentage;
  double rate;
  double cgst;
  double sgst;
  double utgst;
  double igst;
  double quantity;
  double? rateAfterGST;
  double totalAmount;
  double? totalGST;
  String? error;
  ItemNotifier({
    this.name,
    this.description = '',
    this.rate = 0,
    this.cgst = 0,
    this.sgst = 0,
    this.utgst = 0,
    this.igst = 0,
    this.quantity = 1.0,
    this.gst_percentage = 0,
    this.error,
    this.totalAmount = 0,
    this.rateAfterGST,
    this.totalGST,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'gst_percentage': gst_percentage,
      'rate': rate,
      'cgst': cgst,
      'sgst': sgst,
      'utgst': utgst,
      'igst': igst,
      'quantity': quantity,
      'totalAmount': totalAmount,
      'rateAfterGST': rateAfterGST,
      'totalGST': totalGST,
      'error': error
    };
  }

  factory ItemNotifier.fromMap(Map<String, dynamic> data) {
    print('item data = $data');
    // print('Path = $path');
    String name = data['name'] ?? '';
    String description = data['description'] ?? '';
    String? error = data['error'] ?? null;
    double rate = data['rate'].toDouble() ?? 0.0;
    int? gst_percentage = data['gst_percentage'];
    double cgst = data['cgst'].toDouble() ?? 0;
    double sgst = data['sgst'].toDouble() ?? 0;
    double utgst = data['utgst'].toDouble() ?? 0;
    double igst = data['igst'].toDouble() ?? 0;
    double totalAmount = data['totalAmount'].toDouble() ?? 0;
    double rateAfterGST = data['rateAfterGST'].toDouble() ?? 0;
    double totalGST = data['totalGST'].toDouble() ?? 0;
    double quantity = data['quantity'].toDouble() ?? 0;
    ItemNotifier item = ItemNotifier(
        name: name,
        rate: rate,
        description: description,
        gst_percentage: gst_percentage,
        error: error,
        cgst: cgst,
        sgst: sgst,
        utgst: utgst,
        igst: igst,
        totalAmount: totalAmount,
        rateAfterGST: rateAfterGST,
        totalGST: totalGST,
        quantity: quantity);
    return item;
  }

  // ItemNotifier copyWith(
  //     {String itemName,
  //     double rate,
  //     double cgst,
  //     double sgst,
  //     double utgst,
  //     double igst,
  //     double totalAmount,
  //     String error}) {
  //   return ItemNotifier(
  //       name: itemName ?? this.name,
  //       description: description ?? this.description,
  //       rate: rate ?? this.rate,
  //       cgst: cgst ?? this.cgst,
  //       sgst: sgst ?? this.sgst,
  //       utgst: utgst ?? this.utgst,
  //       igst: igst ?? this.igst,
  //       totalAmount: totalAmount ?? this.totalAmount,
  //       error: error ?? this.error,
  //       quantity: quantity ?? this.quantity);
  // }

  // void updateWith(
  //     {String itemName,
  //     String description,
  //     String error,
  //     double rate,
  //     double cgst,
  //     double sgst,
  //     int quantity}) {
  //   this.name = itemName ?? this.name;
  //   this.description = description ?? this.description;
  //   this.rate = rate ?? this.rate;
  //   this.cgst = cgst ?? this.cgst;
  //   this.sgst = sgst ?? this.sgst;
  //   this.quantity = quantity ?? this.quantity;
  //   this.error = error ?? this.error;
  //   notifyListeners();
  // }

  @override
  String toString() => 'amount: $rate';
}
