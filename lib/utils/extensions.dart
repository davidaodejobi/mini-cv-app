import 'package:flutter/material.dart';

//extension for padding
extension PaddingExtension on Widget {
  Widget paddingAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }
}

//for sized box
extension SizedBoxExtension on num {
  Widget get h => SizedBox(height: double.tryParse(toString()));

  Widget get w => SizedBox(width: double.tryParse(toString()));
}
