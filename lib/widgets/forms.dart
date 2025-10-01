import 'package:flutter/material.dart';
import '../utils/validators.dart';

Widget myFormField(
  updateCallback,
  String label, {
  bool obscure = false,
  validator = validateNotEmpty,
}) {
  return TextFormField(
    obscureText: obscure,
    onChanged: (value) => updateCallback(label, value),
    validator: (value) => validator(label, value),
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      constraints: BoxConstraints(maxWidth: 300),
    ),
  );
}
