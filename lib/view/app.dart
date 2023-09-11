import 'package:flutter/material.dart';

import 'home/home_controller.dart';
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
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: ThemeData(
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
          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          // onGenerateRoute: (RouteSettings routeSettings) {
          //   return MaterialPageRoute<void>(
          //     settings: routeSettings,
          //     builder: (BuildContext context) {
          //       switch (routeSettings.name) {
          //         case SettingsView.routeName:
          //           return SettingsView(controller: settingsController);
          //         case SampleItemDetailsView.routeName:
          //           return const SampleItemDetailsView();
          //         case SampleItemListView.routeName:
          //         default:
          //           return const SampleItemListView();
          //       }
          //     },
          //   );
          // },
        );
      },
    );
  }
}
