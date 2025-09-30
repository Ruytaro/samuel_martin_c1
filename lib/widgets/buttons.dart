import 'package:flutter/material.dart';
import 'padding.dart';

Padding paddedButton(callback, Widget label) {
  return customPadding(ElevatedButton(onPressed: callback, child: label));
}
