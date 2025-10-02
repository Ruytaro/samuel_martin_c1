import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/widgets/padding.dart';
import '../utils/validators.dart';

Widget myFormField(
  Function updateCallback,
  String label, {
  bool obscure = false,
  validator = validateNotEmpty,
}) {
  return edgePadding( TextFormField(
    obscureText: obscure,
    onChanged: (value) => updateCallback(label, value),
    validator: (value) => validator(label, value),
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      constraints: BoxConstraints(maxWidth: 300),
    ),
  ));
}
