import 'package:cv_app/constant/base_user.dart';
import 'package:cv_app/model/user.dart';
import 'package:flutter/material.dart';

import '../service/home_service.dart';

class HomeController with ChangeNotifier {
  HomeController(this._settingsService);

  final HomeService _settingsService;
  User _user = baseUser;

  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;
  User get user => _user;

  Future<void> initialize() async {
    _themeMode = await _settingsService.themeMode();

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

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    notifyListeners();
  }
}
