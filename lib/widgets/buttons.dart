import 'package:flutter/material.dart';

ElevatedButton myElevatedButton(VoidCallback? callback, Widget label) {
 return ElevatedButton(onPressed: callback, child: label);
}
