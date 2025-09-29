import 'package:flutter/material.dart';
import '../utils/forms.dart';

TextFormField buildFormField(String label, {bool obscure = false}) {
  return TextFormField(
      obscureText: obscure,
      onChanged: (value) => updateField(label, value),
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      constraints: BoxConstraints(maxWidth: 300),
    ),
  );
}
