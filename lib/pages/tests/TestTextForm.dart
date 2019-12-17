import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestTextForm extends StatelessWidget{
  final String header;
  final TextEditingController controller;
  TestTextForm({@required this.controller, this.header});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          header
        ),
        TextField(
          inputFormatters: <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly
          ],
          keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
          controller: controller,
        )
      ],
    );
  }
}