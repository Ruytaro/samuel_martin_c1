import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Image myImageFile(String path, double? size) {
  if (kIsWeb) {
    return Image.network(path, width: size);
  }
  File file = File(path);
  return Image.file(file, width: size);
}
