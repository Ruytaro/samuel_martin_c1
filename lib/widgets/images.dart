import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';

Image myImageFile(XFile image, double? size) {
  if (kIsWeb) {
    return Image.network(image.path, width: size);
  }
  File file = File(image.path);
  return Image.file(file, width: size);
}

Image myImageAsset(String path, double? size) {
  if (kIsWeb) {
    return Image.asset(path, width: size);
  }
  return Image.asset(path, width: size);
}
