import 'package:flutter/material.dart';

class ShapeWidget  {

  static getShapeBorderWidget() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
    );
  }
}
