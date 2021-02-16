class Util {
  static String parsePhoneNumber(String phoneNumber) {
    if (phoneNumber.startsWith('+91')) return phoneNumber;
    return '+91' + phoneNumber;
  }

  static String getPhoneNumberWithoutCountryCode(String phoneNumber) {
    if (phoneNumber.startsWith('+91')) return phoneNumber.substring(3);
    return phoneNumber;
  }
}
