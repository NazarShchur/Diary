import 'package:course/pages/schedule/schedulePageModel.dart';
import 'package:course/service/scheduleParsingService.dart';
import 'package:course/styles/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputGroupAlert extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputGroupAlertState();
}

class _InputGroupAlertState extends State<InputGroupAlert> {
  String text;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SchedulePageModel>(context);
    return AlertDialog(
      title: Text(Constants.INPUT_GROUP_NAME),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            onSubmitted: (text) {
              setState(() {
                this.text = text;
              });
            },
          ),
          text != null
              ? FutureBuilder<String>(
                  future: getMessage(text, model),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: Constants
                                .SETTINGS_INPUT_GROUP_ERR_MESS_PADDiNG),
                        child: Text(
                          snapshot.data,
                          style: TextStyle(color: Colors.grey, fontSize: Constants.SETTINGS_INPUT_GROUP_ERR_MESS_FONT_SIZE),
                        ),
                      );
                    } else {
                      return Text("");
                    }
                  },
                )
              : Container()
        ],
      ),
      actions: [
        FlatButton(
          child: Text(Constants.CANCEL),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }

  void inputGroup(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.SHARED_PREFS_GROUP, text);
    print("inputed");
  }

  Future<String> getMessage(text, model) async {
    bool isExist = await ScheduleParsingService().isGroupExists(text);
    if (isExist) {
      inputGroup(text);
      model.resetLessons();
      Navigator.pop(context);
      return Constants.GROUP_FOUND;
    } else {
      return Constants.CAN_NOT_FIND_GROUP;
    }
  }
}
