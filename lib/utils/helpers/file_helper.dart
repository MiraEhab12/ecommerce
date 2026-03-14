import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:dio/dio.dart';

class FileHelper {
  static MultipartFile getMultiPartFile(File? file)  =>
       MultipartFile.fromFileSync(file?.path ?? '',
          filename: getBaseName(file));

  static getBaseName(File? file)  => path.basename(file?.path ?? '');
}
