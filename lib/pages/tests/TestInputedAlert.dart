import 'package:course/styles/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestInputAlert extends StatelessWidget {
  final String header;

  TestInputAlert(this.header);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(header),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(Constants.UNDERSTAND),
        )
      ],
    );
  }
}
