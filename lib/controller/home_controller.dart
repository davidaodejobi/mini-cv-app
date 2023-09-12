import 'package:cv_app/constant/base_user.dart';
import 'package:cv_app/model/user.dart';
import 'package:flutter/material.dart';

import '../service/home_service.dart';

class HomeController with ChangeNotifier {
  HomeController(this._settingsService);

  // Make SettingsService a private variable so it is not used directly.
  final HomeService _settingsService;
  User _user = baseUser;

  // Make ThemeMode a private variable so it is not updated directly without
  // also persisting the changes with the SettingsService.
  late ThemeMode _themeMode;

  // Allow Widgets to read the user's preferred ThemeMode.
  ThemeMode get themeMode => _themeMode;
  User get user => _user;

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> initialize() async {
    _themeMode = await _settingsService.themeMode();

    // Important! Inform listeners a change has occurred.
    notifyListeners();
  }

  //Update the user's details
  void editDetails({
    required String name,
    required String bio,
    required String imageUrl,
    required String slackUserName,
  }) {
    _user = _user.copyWith(
      name: name,
      bio: bio,
      imageUrl: imageUrl,
      slackUserName: slackUserName,
    );
    notifyListeners();
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    notifyListeners();
  }
}
