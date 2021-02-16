// import 'package:flutter/foundation.dart';
// import 'package:kretaa/model/bill_notifier.dart';
// import 'package:kretaa/model/item.dart';
// import 'package:kretaa/model/reward_setting_doc.dart';
// import 'package:kretaa/services/database.dart';

// class ValidationItem {
//   final String value;
//   final String error;

//   ValidationItem({this.value, this.error});
// }

// class EditBillModel with ChangeNotifier {
//   ValidationItem _phoneNumberValidation = ValidationItem();
//   List<ValidationItem> _itemNameValidation = List<ValidationItem>();

//   ValidationItem get phoneNumberValidation => _phoneNumberValidation;
//   List<ValidationItem> get itemNameValidation => _itemNameValidation;
//   final Database database;
//   BillNotifier bill;
//   String otp;
//   int rewardPercentage;
//   bool gstIncluded;
//   EditBillModel(
//       {@required this.database,
//       this.bill,
//       this.rewardPercentage,
//       this.otp,
//       this.gstIncluded = true});

//   void updateWith(
//       {String documentId,
//       String description,
//       double amount,
//       String customerPhoneNumber,
//       int rewardPointsGiven,
//       int redeemRewardPoints,
//       int rewardPercentage,
//       String otp,
//       bool gstIncluded,
//       List<ItemNotifier> item}) {
//     this.bill.documentId = documentId ?? this.bill.documentId;
//     this.bill.description = description ?? this.bill.description;
//     this.bill.amount = amount ?? this.bill.amount;
//     this.bill.customerPhoneNumber =
//         customerPhoneNumber ?? this.bill.customerPhoneNumber;
//     this.bill.rewardPointsGiven =
//         rewardPointsGiven ?? this.bill.rewardPointsGiven;
//     this.bill.redeemRewardPoints =
//         redeemRewardPoints ?? this.bill.redeemRewardPoints;
//     this.otp = otp ?? this.otp;
//     this.bill.item = item ?? this.bill.item;
//     this.rewardPercentage = rewardPercentage ?? this.rewardPercentage;
//     this.gstIncluded = gstIncluded ?? this.gstIncluded;

//     if (item == null) updateAllItem();
//     notifyListeners();
//   }

//   void updateAllItem() {
//     for (int i = 0; i < bill.item.length; i++) {
//       updateItem(index: i);
//     }
//   }

//   void changePhoneNumber(String value) {
//     if (value.length == 10) {
//       _phoneNumberValidation = ValidationItem(value: value, error: null);
//     } else {
//       _phoneNumberValidation =
//           ValidationItem(value: null, error: "Must be 10 characters");
//     }
//     notifyListeners();
//   }

//   // void updateItemName(String itemName, int index) {
//   //   if (_itemNameValidation.length < index)
//   //     _itemNameValidation.add(ValidationItem());
//   //   if (itemName.length > 20)
//   //     _itemNameValidation[index] = ValidationItem(
//   //         error: 'Name must less than 20 characters', value: null);
//   //   else
//   //     _itemNameValidation[index] = ValidationItem(error: null, value: itemName);
//   //   this.item[index].name = itemName;
//   //   notifyListeners();
//   // }

//   updateItem({
//     @required int index,
//     String name,
//     String description,
//     double rate,
//     int quantity,
//     GST gst,
//   }) {
//     ItemNotifier item = this.bill.item[index];
//     item.name = name ?? item.name;
//     item.description = description ?? item.description;
//     item.rate = rate ?? item.rate;
//     item.quantity = quantity ?? item.quantity;
//     item.gst = gst ?? item.gst;

//     double itemTotal = (item.quantity * item.rate);
//     int gstRate = getGSTRate(item.gst);
//     double gstTax = 0.0;
//     if (this.gstIncluded) {
//       gstTax = itemTotal - (itemTotal * (100 / (100 + gstRate)));
//       item.rateAfterGST = (itemTotal - gstTax) / item.quantity;
//     } else {
//       gstTax = itemTotal * gstRate / 100;
//       item.rateAfterGST = item.rate;
//     }
//     item.cgst = gstTax / 2;
//     item.sgst = gstTax / 2;
//     item.totalGST = gstTax;
//     item.totalAmount = item.rateAfterGST * item.quantity + gstTax;
//     this.bill.item[index] = item;
//     notifyListeners();
//   }
//   // void upsertItemName({dynamic name, int index}) {
//   //   if (this.item.length < index)
//   //     this.item.add(ItemNotifier(itemName: name));
//   //   else
//   //     this.item[index].name = name;
//   //   updateWith();
//   // }

//   void addItem() {
//     if (this.bill.item == null) this.bill.item = List<ItemNotifier>();
//     this.bill.item.add(ItemNotifier());
//     notifyListeners();
//   }

//   Future<int> setRewardPoint() async {
//     RewardSettingDoc rewardSettingStream = await database
//         .rewardSettingStream(
//             shopDocumentId: database.loggedInUser.shopDocumentId)
//         .first;

//     int rewardPercentage = rewardSettingStream.reward_percentage;
//     updateWith(rewardPercentage: rewardPercentage);
//     return rewardPercentage;
//   }

//   int getGSTRate(GST g) {
//     switch (g) {
//       case GST.gst_0:
//         {
//           return 0;
//         }

//       case GST.gst_5:
//         {
//           return 5;
//         }
//         break;
//       case GST.gst_6:
//         {
//           return 6;
//         }
//         break;
//       case GST.gst_12:
//         {
//           return 12;
//         }
//         break;
//       case GST.gst_28:
//         {
//           return 28;
//         }
//         break;
//       default:
//         {
//           return 0;
//         }
//         break;
//     }
//   }
//   // EditBillModel m;

//   // Future<void> submit() async {
//   //   updateWith(submitted: true, isLoading: true);
//   //   try {
//   //     if (formType == EmailSignInFormType.signIn) {
//   //       await auth.signInWithEmailAndPassword(email, password);
//   //     } else {
//   //       await auth.createUserWithEmailAndPassword(email, password);
//   //     }
//   //   } catch (e) {
//   //     updateWith(isLoading: false);
//   //     rethrow;
//   //   }
//   // }

//   // bool get canSubmit {
//   //   return emailValidator.isValid(email) &&
//   //       passwordValidator.isValid(password) &&
//   // }

//   // String get passwordErrorText {
//   //   bool showErrorText = submitted && !passwordValidator.isValid(password);
//   //   return showErrorText ? invalidPasswordErrorText : null;
//   // }

//   // String get emailErrorText {
//   //   bool showErrorText = submitted && !emailValidator.isValid(email);
//   //   return showErrorText ? invalidEmailErrorText : null;
//   // }

// }
