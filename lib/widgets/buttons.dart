import 'package:flutter/material.dart';

ElevatedButton myElevatedButton(callback, Widget label) {
 return ElevatedButton(onPressed: callback, child: label);
}
