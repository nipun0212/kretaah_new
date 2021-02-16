import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:kretaa/services/database.dart';
import 'package:kretaa/shop_admin/state/setting_model.dart';
import 'package:kretaa/shop_admin/state/setting_state.dart';
import 'package:state_notifier/state_notifier.dart';

class SettingModels extends ChangeNotifier {
  final Database database;
  SettingModel settingModel;

  SettingModels({this.settingModel, @required this.database}) {
    init();
  }

  void init() async {
    // if (documentId != null) {
    state = SettingState.data(await (await database
        .rewardSettingStream(
            shopDocumentId: database.loggedInUser.shopDocumentId)
        .first));
    // }
    this.settingModel = await (await database
        .rewardSettingStream(
            shopDocumentId: database.loggedInUser.shopDocumentId)
        .first);
    ;
  }

  void updateGST(String gst_setting) async {
    state = SettingState.dataLoading(true);
    await Future.delayed(Duration(seconds: 3));
    SettingModel data =
        state.maybeWhen(data: (data) => data, orElse: () => SettingModel()
            // dataLoading: (d) => SettingModel(),
            // error: (error) => SettingModel()
            );
    data = data.copyWith(default_gst_setting: gst_setting);

    state = SettingState.data(data);
    print(' state = ${state.toString()}');
    state = SettingState.dataLoading(false);
    print(
        ' state = ${state.toString()}'); // state = SettingState.dataLoading(setting)
  }

  void updateRewardPoint(String percentage) {
    SettingModel data =
        state.maybeWhen(data: (data) => data, orElse: () => SettingModel()
            // dataLoading: (d) => SettingModel(),
            // error: (error) => SettingModel()
            );
    data = data.copyWith(reward_percentage: int.parse(percentage));
    state = SettingState.data(data);
    print(state.toString());
    // state = SettingState.dataLoading(setting)
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
