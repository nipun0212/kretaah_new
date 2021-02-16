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
//   List<ItemNotifier> item;
//   int itemCount = 1;
//   String documentId;
//   String description;
//   String error;

//   int id;
//   int rewardPointsGiven;
//   int redeemRewardPoints;
//   bool isProcessing;
//   String customerPhoneNumber;
//   double amount = 0;
//   String updatedByUID;
//   String customerUID;
//   dynamic updatedOn;
//   String shopDocumentId;
//   String otp;
//   int rewardPercentage;
//   bool gstIncluded;
//   EditBillModel(
//       {@required this.database,
//       this.documentId,
//       this.id,
//       this.description,
//       this.amount,
//       this.isProcessing,
//       this.customerPhoneNumber,
//       this.updatedByUID,
//       this.customerUID,
//       this.updatedOn,
//       this.rewardPointsGiven,
//       this.redeemRewardPoints,
//       this.shopDocumentId,
//       this.item,
//       this.rewardPercentage,
//       this.itemCount = 1,
//       this.otp,
//       this.gstIncluded = true});

//   void updateWith(
//       {String documentId,
//       String description,
//       String id,
//       double amount,
//       String isProcessing,
//       String updatedByUID,
//       String customerPhoneNumber,
//       String customerUID,
//       dynamic updatedOn,
//       int rewardPointsGiven,
//       int redeemRewardPoints,
//       String shopId,
//       int rewardPercentage,
//       String otp,
//       int itemCount,
//       bool gstIncluded,
//       List<ItemNotifier> item}) {
//     this.documentId = documentId ?? this.documentId;
//     this.description = description ?? this.description;
//     this.id = id ?? this.id;
//     this.isProcessing = isProcessing ?? this.isProcessing;
//     this.amount = amount ?? this.amount;
//     this.updatedByUID = updatedByUID ?? this.updatedByUID;
//     this.customerUID = customerUID ?? this.customerUID;
//     this.updatedOn = updatedOn ?? this.updatedOn;
//     this.customerPhoneNumber = customerPhoneNumber ?? this.customerPhoneNumber;
//     this.rewardPointsGiven = rewardPointsGiven ?? this.rewardPointsGiven;
//     this.redeemRewardPoints = redeemRewardPoints ?? this.redeemRewardPoints;
//     this.shopDocumentId = shopId ?? this.shopDocumentId;
//     this.otp = otp ?? this.otp;
//     if (this.item != null) {}
//     this.item = item ?? this.item;
//     this.rewardPercentage = rewardPercentage ?? this.rewardPercentage;
//     this.itemCount = itemCount ?? this.itemCount;
//     this.gstIncluded = gstIncluded ?? this.gstIncluded;
//     notifyListeners();
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

//   void updateItemName(String itemName, int index) {
//     if (_itemNameValidation.length < index)
//       _itemNameValidation.add(ValidationItem());
//     if (itemName.length > 20)
//       _itemNameValidation[index] = ValidationItem(
//           error: 'Name must less than 20 characters', value: null);
//     else
//       _itemNameValidation[index] = ValidationItem(error: null, value: itemName);
//     this.item[index].itemName = itemName;
//     notifyListeners();
//   }

//   updateItem(ItemNotifier item) {
//     double itemTotal = (item.quantity * item.rate);
//     int gstRate = getGSTRate(item.gst);
//     double gstTax = 0.0;
//     if (this.gstIncluded)
//       gstTax = itemTotal - (itemTotal * (100 / (100 + gstRate)));
//     else
//       gstTax = itemTotal * gstRate / 100;

//     item.cgst = gstTax / 2;
//     item.sgst = gstTax / 2;
//     item.totalAmount = itemTotal - gstTax;
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
//     if (this.item == null) this.item = List<ItemNotifier>();
//     this.item.add(ItemNotifier());
//     print('item = ${this.item}');

//     updateWith();
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
