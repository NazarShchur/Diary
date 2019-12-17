import 'package:course/pages/bottomnavigation/NavigationModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NavigationModel>(context);
    return model.button;
  }
  
}