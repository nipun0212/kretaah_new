import 'package:meta/meta.dart';

class SettingDoc {
  String documentId;
  int reward_percentage;
  String default_gst_setting;
  String path;

  SettingDoc(
      {this.documentId,
      @required this.reward_percentage,
      this.path,
      this.default_gst_setting});

  Map<String, dynamic> toMap() {
    return {
      'reward_percentage': reward_percentage,
      'default_gst_setting': default_gst_setting,
    };
  }

  factory SettingDoc.fromMap(
      Map<String, dynamic> data, String documentId, String path) {
    final int reward_percentage = data['reward_percentage'];
    final String default_gst_setting = data['default_gst_setting'];
    SettingDoc rewardSettingDoc = SettingDoc(
        documentId: documentId,
        reward_percentage: reward_percentage,
        default_gst_setting: default_gst_setting,
        path: path);

    print(rewardSettingDoc);
    return rewardSettingDoc;
  }

  @override
  String toString() =>
      'documentId: $documentId, reward_percentage: $reward_percentage';
}
