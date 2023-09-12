import 'package:flutter/material.dart';

import 'controller/home_controller.dart';
import 'service/home_service.dart';
import 'view/app.dart';

void main() async {
  final settingsController = HomeController(HomeService());
  await settingsController.initialize();

  runApp(MyApp(settingsController: settingsController));
}
