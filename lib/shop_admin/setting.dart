import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kretaa/common_widgets/custom_card.dart';
import 'package:kretaa/common_widgets/form_input.dart';
import 'package:kretaa/model/gst.dart';
import 'package:kretaa/model/setting_doc.dart';
import 'package:kretaa/services/database.dart';
import 'package:kretaa/shop_admin/setting_change_notifier_model.dart';
import 'package:kretaa/shop_admin/shop_admin_home.dart';
import 'package:kretaa/shop_admin/state/setting_model.dart';
import 'package:kretaa/shop_admin/state/setting_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class Setting extends StatefulWidget {
  final SettingChangeNotifierModel model;

  @override
  _SettingState createState() => _SettingState();
  Setting({this.model});
  static Widget create(BuildContext context, String documentId) {
    final database = Provider.of<Database>(context, listen: false);
    return ChangeNotifierProvider<SettingChangeNotifierModel>(
        create: (_) => SettingChangeNotifierModel(
              database: database,
            ),
        child: Consumer<SettingChangeNotifierModel>(
          builder: (_, model, __) {
            return Setting(
              model: model,
            );
          },
        ));
  }
}

class _SettingState extends State<Setting> {
  // SettingModel model;
  TextEditingController _rewardPercentageController = TextEditingController();
  TextEditingController _defaultGstSettingController = TextEditingController();
  SettingChangeNotifierModel model;
  @override
  void initState() {
    model = widget.model;
    _rewardPercentageController.text =
        model.settingModel?.reward_percentage?.toString();
    _defaultGstSettingController.text = model.settingModel?.default_gst_setting;
    // initializeModel();

    super.initState();
  }

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
    final database = Provider.of<Database>(context, listen: false);
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await model.setModel();
    // });
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
                      model.updateRewardPercentage(v);
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
                          model.updateGST(v);
                        },
                        value: model.settingModel.default_gst_setting),
                  ],
                ),
                RaisedButton(
                  onPressed: () => submit(context),
                  color: Colors.greenAccent,
                  child: Text('Submit'),
                ),
              ],
            );
          }),
    );
  }

  void submit(BuildContext context) {
    model.submit();
    var snackbar = SnackBar(
      content: Text('Setting Update'),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
