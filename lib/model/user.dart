import 'package:meta/meta.dart';

class User {
  final String documentId;
  final String name;
  final String phoneNumber;
  final String photoURL;
  final bool isShopOwner;
  final bool isGlobalAdmin;
  final String shopDocumentId;

  User(
      {this.documentId,
      @required this.name,
      this.phoneNumber,
      this.photoURL,
      this.isShopOwner,
      this.isGlobalAdmin,
      this.shopDocumentId});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'photoURL': photoURL,
      'isOwner': isShopOwner,
      'isGlobalAdmin': isGlobalAdmin,
      'shopDocumentId': shopDocumentId
    };
  }

  factory User.fromMap(Map<String, dynamic> data, String documentId) {
    final String name = data['name'];
    final String phoneNumber = data['phoneNumber'];
    final String photoURL = data['photoURL'];
    final bool isOwner = data['isOwner'];
    final bool isGlobalAdmin = data['isGlobalAdmin'];
    final String shopDocumentId = data['shopDocumentId'];

    User user = User(
        documentId: documentId,
        name: name,
        phoneNumber: phoneNumber,
        photoURL: photoURL,
        isShopOwner: isOwner,
        isGlobalAdmin: isGlobalAdmin,
        shopDocumentId: shopDocumentId);
    print(user);
    return user;
  }

  @override
  String toString() =>
      'documentId: $documentId, name: $name, phoneNumber: $phoneNumber,photoURL:$photoURL,isOwner:$isShopOwner';

  User copyWith(
      {String documentId,
      String name,
      String phoneNumber,
      String photoURL,
      bool isOwner,
      bool isGlobalAdmin,
      String shopDocumentId}) {
    return User(
        documentId: documentId ?? this.documentId,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        photoURL: photoURL ?? this.photoURL,
        isShopOwner: isOwner ?? this.isShopOwner,
        isGlobalAdmin: isGlobalAdmin ?? this.isGlobalAdmin,
        shopDocumentId: shopDocumentId ?? this.shopDocumentId);
  }
}
