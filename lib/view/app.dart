import 'package:flutter/material.dart';

import '../controller/home_controller.dart';
import 'home/home_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final HomeController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.black,
            appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(
                  color: Colors.black,
                )),
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                color: Colors.black,
                fontFamily: 'Morganite',
                height: 0.8,
                fontSize: 72,
              ),
              titleLarge: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
              ),
              titleMedium: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          darkTheme: ThemeData(
            primaryColor: Colors.white,
            appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(
                  color: Colors.white,
                )),
            brightness: Brightness.dark,
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                color: Colors.white,
                fontFamily: 'Morganite',
                height: 0.8,
                fontSize: 72,
              ),
              titleLarge: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
              ),
              titleMedium: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          themeMode: settingsController.themeMode,
          home: HomeView(
            controller: settingsController,
          ),
        );
      },
    );
  }
}
