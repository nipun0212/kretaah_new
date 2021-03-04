import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:kretaa/services/database.dart';
import 'package:kretaa/shop_admin/state/setting_model.dart';
import 'package:kretaa/shop_admin/state/setting_state.dart';

class SettingChangeNotifierModel extends ChangeNotifier {
  final Database database;
  SettingModel? settingModel;
  bool isLoading = false;

  SettingChangeNotifierModel({required this.database}) {
    init();
  }

  void init() async {
    this.settingModel = await (await database
        .rewardSettingStream(
            shopDocumentId: database.loggedInUser!.shopDocumentId)
        .first);
    notifyListeners();
  }

  void updateGST(String? gst_setting) async {
    this.settingModel =
        this.settingModel!.copyWith(default_gst_setting: gst_setting);
    notifyListeners();
  }

  void updateRewardPercentage(String percentage) {
    this.settingModel =
        this.settingModel!.copyWith(reward_percentage: int.parse(percentage));
  }

  void submit() {
    this.isLoading = true;
    database.updateRewardSetting(
        shopDocumentId: database.loggedInUser!.shopDocumentId,
        rewardSettingDoc: this.settingModel);
    this.isLoading = false;
  }
  // void updateWith(
  //     {String documentId, String default_gst_setting, int reward_percentage}) {
  //   this.model = this.model.copyWith(documentId: documentId);
  //   this.model = this.model.copyWith(default_gst_setting: default_gst_setting);
  //   this.model = this.model.copyWith(reward_percentage: reward_percentage);
  //   // this.model.default_gst_setting =
  //   //     default_gst_setting ?? this.model.default_gst_setting;
  //   // this.model.reward_percentage =
  //   //     reward_percentage ?? this.model.reward_percentage;
  //   // notifyListeners();
  // }

  // setGSt({default_gst_setting}) {
  //   this.model = this.model.copyWith(default_gst_setting: default_gst_setting);
  // }

  // Future<void> setModel() async {
  //   RewardPointState rewardSettingStream = await database
  //       .rewardSettingStream(
  //           shopDocumentId: database.loggedInUser.shopDocumentId)
  //       .first;

  //   int reward_percentage = rewardSettingStream.reward_percentage;
  //   String default_gst_setting = rewardSettingStream.default_gst_setting;
  //   this.model = this.model.copyWith(
  //       reward_percentage: reward_percentage,
  //       default_gst_setting: default_gst_setting);
  //   // updateWith(
  //   //     reward_percentage: reward_percentage,
  //   //     default_gst_setting: default_gst_setting);
  //   // return rewardSettingStream;
  // }

  // void submitModel() async {
  //   await database.updateRewardSetting(
  //       shopDocumentId: database.loggedInUser.shopDocumentId,
  //       rewardSettingDoc: this.model);
  // }
}
