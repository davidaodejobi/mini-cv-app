import 'package:flutter/material.dart';

class HomeService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async => ThemeMode.system;
}
