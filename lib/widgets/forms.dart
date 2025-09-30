import 'package:flutter/material.dart';

Padding buildFormField(validator, updateCallback, String label, {bool obscure = false}) {
  return Padding(
    padding: EdgeInsetsGeometry.all(8),
    child: TextFormField(
      obscureText: obscure,
      onChanged: (value) => updateCallback(label,value),
      validator: (value) => validator(label,value),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        constraints: BoxConstraints(maxWidth: 300),
      ),
    ),
  );
}
