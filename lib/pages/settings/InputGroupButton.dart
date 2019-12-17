import 'package:course/pages/schedule/schedulePageModel.dart';
import 'package:course/pages/settings/InputGroupAlert.dart';
import 'package:course/service/scheduleParsingService.dart';
import 'package:course/styles/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SettingsElement.dart';

class InputGroupButton extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _InputGroupButton();
}

class _InputGroupButton extends State<InputGroupButton>{

  @override
  Widget build(BuildContext context) {

    return SettingsElement(
      icon: Icons.people,
      text: Constants.CHANGE_GROUP,
      onTap: (){
        showDialog(
            context: context,
            builder: (context){
             return InputGroupAlert();
            }
        );
      },
    );
  }


}