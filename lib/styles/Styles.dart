import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Styles{
  static final Color mainColor = Color.fromRGBO(86, 86, 86, 1);
  static final double globalSidePadding = 20.0;
  static final BoxShadow boxShadow = BoxShadow(
    color: Colors.black,
    offset: Offset(1.0, 1.0),
    blurRadius: 5.0,
  );//static final Back
}