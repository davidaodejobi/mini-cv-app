import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/home/home_controller.dart';
import 'src/home/home_service.dart';

void main() async {
  final settingsController = HomeController(HomeService());
  await settingsController.initialize();

  runApp(MyApp(settingsController: settingsController));
}
