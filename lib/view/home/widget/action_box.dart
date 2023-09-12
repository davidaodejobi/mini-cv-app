import 'package:cv_app/controller/home_controller.dart';
import 'package:cv_app/view/edit/edit_view.dart';
import 'package:flutter/material.dart';

class ActionBox extends StatelessWidget {
  const ActionBox({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(100),
            blurRadius: 10.0,
            spreadRadius: 0.0,
          ),
        ],
        color: Colors.grey.withOpacity(0.2),
      ),
      child: Column(
        children: [
          IconButton(
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
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EditView(
                  controller: controller,
                ),
              ),
            ),
            icon: const Icon(Icons.edit_note_sharp),
          ),
        ],
      ),
    );
  }
}
