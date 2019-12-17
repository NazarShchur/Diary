import 'package:course/dao/DAOFactory.dart';
import 'package:course/dao/interfaces/GenchiDAO.dart';
import 'package:course/entity/Genchi.dart';
import 'package:course/pages/tests/SubminButton.dart';
import 'package:course/pages/tests/TestInputedAlert.dart';
import 'package:course/styles/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TestTextForm.dart';

class GenchiPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final GenchiDAO dao = DaoFactory.getInstance().createGenchiDao();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TestTextForm(controller: controller, header: Constants.BREATHLESS_TIME),
        SubmitButton(onTap: (){
          onTap(context);
        })
      ],
    );
  }

  void onTap(BuildContext context) {
    String header;
    try {
      dao.save(Genchi(
        breathLessTime: int.parse(controller.text),
        date: DateTime(DateTime
            .now()
            .year, DateTime
            .now()
            .month, DateTime
            .now()
            .day),
      ));
      header = Constants.INDEX_GENCHI_SUBMITTED;
    } catch (e){
      header = Constants.SOMETHING_WENT_WRONG;
    }
    showDialog(context: context, builder: (context){
      return TestInputAlert(header);
    });
  }
}
