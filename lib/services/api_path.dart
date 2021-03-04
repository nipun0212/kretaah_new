class ApiPath {
  static String Shops() => 'shops';
  static String Shop(String? documentId) => 'shops/$documentId';
  static String Bills({String? shopDocumentId}) => 'shops/$shopDocumentId/bills';
  static String Bill({String? shopDocumentId, String? billId}) =>
      'shops/$shopDocumentId/bills/$billId';
  static String GST() => 'gst/gst';
  static String Users() => 'users';
  static String user({String? uid}) => 'users/$uid';
  static String Customers({String? shopDocumentId}) =>
      'shops/$shopDocumentId/customers';
  static String RewardSetting(String? shopDocumentId) =>
      'shops/$shopDocumentId/private/reward_setting';
}

class StoragePath {
  static String profilePhoto(String uid) => 'profilePhoto/$uid';
}
