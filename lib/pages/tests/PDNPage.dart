import 'package:course/dao/DAOFactory.dart';
import 'package:course/dao/interfaces/IPDNDao.dart';
import 'package:course/entity/PDN.dart';
import 'package:course/pages/tests/SubminButton.dart';
import 'package:course/pages/tests/TestTextForm.dart';
import 'package:course/styles/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TestInputedAlert.dart';

class PDNPage extends StatelessWidget {
  final TextEditingController beforeController = TextEditingController();
  final TextEditingController afterController = TextEditingController();
  final PDNDao dao = DaoFactory.getInstance().createPDNDao();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TestTextForm(
            controller: beforeController, header: Constants.PULSE_BEFORE_SIT),
        TestTextForm(
            controller: afterController, header: Constants.PULSE_AFTER_SIT),
        SubmitButton(
          onTap: () {
            onTap(context);
          },
        )
      ],
    );
  }

  void onTap(BuildContext context) {
    String header;
    try {
      dao.save(PDN(
        pulseBeforeSits: int.parse(beforeController.text),
        pulseAfterSits: int.parse(afterController.text),
        date: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
      ));
      header = Constants.PDN_SUBMITTED;
    } catch (e) {
      header = Constants.SOMETHING_WENT_WRONG;
    }
    showDialog(
        context: context,
        builder: (context) {
          return TestInputAlert(header);
        });
  }
}
