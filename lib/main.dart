import 'package:flutter/material.dart';

import 'view/app.dart';
import 'view/home/home_controller.dart';
import 'view/home/home_service.dart';

void main() async {
  final settingsController = HomeController(HomeService());
  await settingsController.initialize();

  runApp(MyApp(settingsController: settingsController));
}
