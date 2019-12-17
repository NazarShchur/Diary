import 'package:course/pages/settings/InputGroupButton.dart';
import 'package:course/pages/settings/SettingsElement.dart';
import 'package:course/styles/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SettingsPageState();

}
class _SettingsPageState extends State<SettingsPage>{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InputGroupButton(),
        InputGroupButton(),
        InputGroupButton(),
      ],
    );
  }

}