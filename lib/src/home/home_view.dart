import 'package:flutter/material.dart';

import 'home_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.controller});

  static const routeName = '/settings';

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'I take Ideas, build them,\n',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        TextSpan(
                          text: '       and learn from them,\n',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        TextSpan(
                          text: '  to create balance.\n',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 5,
              child: IconButton(
                onPressed: () => controller.updateThemeMode(
                  controller.themeMode == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light,
                ),
                icon: Builder(
                  builder: (_) {
                    switch (controller.themeMode) {
                      case ThemeMode.light:
                        return const Icon(Icons.dark_mode);
                      case ThemeMode.dark:
                        return const Icon(Icons.light_mode);
                      default:
                        return const Icon(Icons.dark_mode);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
