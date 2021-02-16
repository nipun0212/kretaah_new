import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kretaa/common_widgets/custom_card.dart';
import 'package:kretaa/common_widgets/form_input.dart';
import 'package:kretaa/model/gst.dart';
import 'package:kretaa/model/setting_doc.dart';
import 'package:kretaa/services/database.dart';
import 'package:kretaa/shop_admin/setting_model.dart';
import 'package:kretaa/shop_admin/shop_admin_home.dart';
import 'package:kretaa/shop_admin/state/setting_model.dart';
import 'package:kretaa/shop_admin/state/setting_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class Setting extends StatefulWidget {
  final String documentId;

  @override
  _SettingState createState() => _SettingState();
  Setting({this.documentId});
  static Widget create(BuildContext context, String documentId) {
    final database = Provider.of<Database>(context, listen: false);
    return StateNotifierProvider<SettingModels, SettingState>(
        create: (_) => SettingModels(
              database: database,
              documentId: documentId,
            ),
        child: Setting());
  }
}

class _SettingState extends State<Setting> {
  // SettingModel model;
  TextEditingController _rewardPercentageController = TextEditingController();
  TextEditingController _defaultGstSettingController = TextEditingController();

  // @override
  // void initState() {
  //   // model = widget.model;
  //   initializeModel();

  //   super.initState();
  // }

  // void submit() {
  //   final model = context.read<SettingModel>();
  //   model.submitModel();
  //   Navigator.pushAndRemoveUntil(
  //     context,
  //     MaterialPageRoute(builder: (BuildContext context) => ShopAdminHome()),
  //     ModalRoute.withName('/home'),
  //   );
  // }

  // void initializeModel() async {
  //   final model = context.read<SettingModel>();
  //   await model.setModel();
  //   _rewardPercentageController.text = model.model.reward_percentage.toString();
  //   _defaultGstSettingController.text = model.model.default_gst_setting;
  // }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SettingModels>();
    final state = context.watch<SettingState>();
    // final isLoading = state.state.;
    // var data= state.state.when(data: (d)=>, dataLoading: null, error: null);
    final database = Provider.of<Database>(context, listen: false);
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await model.setModel();
    // });
    SettingModel data =
        state.maybeWhen(data: (data) => data, orElse: () => SettingModel());
    _rewardPercentageController.text = data.reward_percentage.toString();
    bool loading =
        state.maybeWhen(dataLoading: (loading) => loading, orElse: () => false);
    _rewardPercentageController.text = data.reward_percentage.toString();
    print('loading = $loading');
    return CustomCard(
      child: StreamBuilder<SettingModel>(
          stream: database.rewardSettingStream(
              shopDocumentId: database.loggedInUser.shopDocumentId),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.active)
              return Center(child: CircularProgressIndicator());
            // setState(() {
            //   _reward_percentage = snapshot.data?.reward_percentage.toString();
            //   _default_gst_tax = snapshot.data?.default_gst_tax;
            // });
            if (loading) return Center(child: CircularProgressIndicator());
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FormInput(
                  name: 'Reward Percentage',
                  textFormField: TextFormField(
                    controller: _rewardPercentageController,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (v) {
                      if (v.length < 3)
                        return 'Please enter valid reward percentage';
                      return null;
                    },
                    autofocus: true,
                    keyboardType: TextInputType.phone,
                    decoration: FormInput.inputDecoration(),
                    onChanged: (v) {
                      model.updateRewardPoint(v);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Default GST', style: TextStyle(fontSize: 16)),
                    DropdownButton(
                        items: Gst()
                            .gst_options
                            .entries
                            .map((e) => DropdownMenuItem(
                                key: Key(e.key),
                                value: e.key,
                                child: Text(e.key)))
                            .toList(),
                        onChanged: (v) async {
                          await model.updateGST(v);
                        },
                        value: data.default_gst_setting),
                  ],
                ),
                RaisedButton(
                  onPressed: () => null,
                  color: Colors.greenAccent,
                  child: Text('Submit'),
                ),
              ],
            );
          }),
    );
  }
}
