import 'package:flutter/material.dart';
import '../utils/validators.dart';
import 'padding.dart';

Widget paddedFormField(
  updateCallback,
  String label, {
  bool obscure = false,
  validator = validateNotEmpty,
}) {
  return customPadding(
    TextFormField(
      obscureText: obscure,
      onChanged: (value) => updateCallback(label, value),
      validator: (value) => validator(label, value),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        constraints: BoxConstraints(maxWidth: 300),
      ),
    ),
  );
}
