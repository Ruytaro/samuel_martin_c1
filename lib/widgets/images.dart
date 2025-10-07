import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';

Image myImage(XFile image,double? w) {
  if (kIsWeb) {
    return Image.network(image.path, width: w);
}
  return Image.file((image as File),width: w);
}
