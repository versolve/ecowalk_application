import 'dart:io';
import 'package:flutter/foundation.dart';

class UserProfileState {
  static final ValueNotifier<String> nameNotifier =
      ValueNotifier<String>('KAYI NYAP NYAP');
  static final ValueNotifier<File?> imageNotifier =
      ValueNotifier<File?>(null);

  static String get name => nameNotifier.value;
  static File? get image => imageNotifier.value;

  static void update({String? name, File? image}) {
    if (name != null && name.trim().isNotEmpty) {
      nameNotifier.value = name.trim();
    }
    if (image != null) {
      imageNotifier.value = image;
    }
  }

  static void reset() {
    nameNotifier.value = 'KAYI NYAP NYAP';
    imageNotifier.value = null;
  }
}
