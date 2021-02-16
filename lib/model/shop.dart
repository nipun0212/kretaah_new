import 'package:meta/meta.dart';

enum ShopState { processing, done, active }

class Shop {
  final String documentId;
  final int id;
  final bool isProcessing;
  final String shopName;
  final String ownerName;
  final String ownerPhoneNumber;
  final String ownerUID;
  final bool isShopActive;

  Shop(
      {this.documentId,
      this.id,
      @required this.shopName,
      @required this.isProcessing,
      @required this.ownerName,
      @required this.ownerPhoneNumber,
      this.ownerUID,
      @required this.isShopActive});

  Map<String, dynamic> toMap() {
    return {
      'shopName': shopName,
      'ownerName': ownerName,
      'ownerPhoneNumber': ownerPhoneNumber,
      'isProcessing': isProcessing,
      'isShopActive': isShopActive
    };
  }

  factory Shop.fromMap(Map<String, dynamic> data, String documentId) {
    // print(data);
    final int id = data['id'];
    final String shopName = data['shopName'];
    final String ownerName = data['ownerName'];
    final bool isProcessing = data['isProcessing'];
    final String ownerPhoneNumber = data['ownerPhoneNumber'];
    final String ownerUID = data['ownerUID'];
    final bool isShopActive = data['isShopActive'];
    // if(ownerPhoneNumber.contains('+91'))
    //   ownerPhoneNumber = ownerPhoneNumber.substring(3);

    Shop shop = Shop(
        documentId: documentId,
        id: id,
        ownerUID: ownerUID,
        ownerName: ownerName,
        ownerPhoneNumber: ownerPhoneNumber,
        shopName: shopName,
        isProcessing: isProcessing,
        isShopActive: isShopActive);
    print(shop);
    return shop;
  }

  // EmailSignInModel copyWith({
  //   String email,
  //   String password,
  //   EmailSignInFormType formType,
  //   bool isLoading,
  //   bool submitted,
  // }) {
  //   return EmailSignInModel(
  //     email: email ?? this.email,
  //     password: password ?? this.password,
  //     formType: formType ?? this.formType,
  //     isLoading: isLoading ?? this.isLoading,
  //     submitted: submitted ?? this.submitted,
  //   );
  // }

  Shop copyWith(
      {String documentId,
      String id,
      String shopName,
      String ownerName,
      String ownerPhoneNumber,
      String isProcessing,
      String isShopActive}) {
    return Shop(
      documentId: documentId ?? this.documentId,
      id: id ?? this.id,
      isProcessing: isProcessing ?? this.isProcessing,
      shopName: shopName ?? this.shopName,
      ownerName: ownerName ?? this.ownerName,
      ownerPhoneNumber: ownerPhoneNumber ?? this.ownerPhoneNumber,
      isShopActive: isShopActive ?? this.isShopActive,
    );
  }

  @override
  String toString() =>
      'id: $id, shopName: $shopName, ownerName: $ownerName,isProcessing:$isProcessing';
}

// class Shop {
//   Shop(
//       {this.id,
//       @required this.name,
//       @required this.address,
//       @required this.ownerPhoneNumber,
//       this.lastUpdatedBy});

//   final String id;
//   final String name;
//   final String address;
//   final String ownerPhoneNumber;
//   String lastUpdatedBy;

//   factory Shop.fromMap(Map<String, dynamic> data, String documentId) {
//     print('Organization from org is $data');
//     if (data == null) {
//       return null;
//     }
//     final String name = data['name'];
//     if (name == null) {
//       return null;
//     }
//     final String address = data['address'];
//     final String ownerPhoneNumber = data['ownerPhoneNumber'];
//     return Shop(
//       id: documentId,
//       name: name,
//       address: address,
//       ownerPhoneNumber: ownerPhoneNumber,
//     );
//   }

//   void setLastUpdated(String lastUpdatedBy) {
//     this.lastUpdatedBy = lastUpdatedBy;
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'address': address,
//       'ownerPhoneNumber': ownerPhoneNumber,
//       'lastUpdatedBy': lastUpdatedBy
//     };
//   }

// //  @override
// //  int get hashCode => hashValues(id, name, ratePerHour);

// //  @override
// //  bool operator ==(other) {
// //    if (identical(this, other)) return true;
// //    if (runtimeType != other.runtimeType) return false;
// //    final Job otherJob = other;
// //    return id == otherJob.id &&
// //        name == otherJob.name &&
// //        ratePerHour == otherJob.ratePerHour;
// //  }

// //  @override
// //  String toString() => 'id: $id, name: $name, ratePerHour: $ratePerHour';
// }
