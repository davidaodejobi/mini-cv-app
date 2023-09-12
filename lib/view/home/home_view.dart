import 'package:cv_app/utils/extensions.dart';
import 'package:cv_app/view/edit/edit_view.dart';
import 'package:flutter/material.dart';

import '../../controller/home_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.controller});

  static const routeName = '/settings';

  final HomeController controller;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Offset position = const Offset(50, 300);
  double prevScale = 1;
  double scale = 1;

  void updateScale(double zoom) => setState(() => scale = prevScale * zoom);
  void commitScale() => setState(() => prevScale = scale);
  void updatePosition(Offset newPosition) =>
      setState(() => position = newPosition);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  20.h,
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
                          text: '  to create balance.',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ],
                    ),
                  ),
                  20.h,
                  DetailsWidget(
                    title: 'Bio',
                    description: widget.controller.user.bio,
                  ),
                  30.h,
                  DetailsWidget(
                    title: '',
                    description: widget.controller.user.imageUrl,
                  ),
                  30.h,
                  DetailsWidget(
                    title: 'Name',
                    description: widget.controller.user.name,
                  ),
                  30.h,
                  DetailsWidget(
                    title: 'Slack Username',
                    description: widget.controller.user.slackUserName,
                  ),
                ],
              ),
            ),
            Positioned(
              left: position.dx,
              top: position.dy,
              child: Draggable(
                maxSimultaneousDrags: 1,
                feedback: Material(
                  child: Container(
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   color: controller.themeMode == ThemeMode.dark
                      //       ? Colors.white10.withAlpha(80)
                      //       : Colors.black.withAlpha(80),
                      // ),
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
                          onPressed: () => widget.controller.updateThemeMode(
                            widget.controller.themeMode == ThemeMode.light
                                ? ThemeMode.dark
                                : ThemeMode.light,
                          ),
                          icon: Builder(
                            builder: (_) {
                              switch (widget.controller.themeMode) {
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
                              builder: (_) => const Scaffold(
                                  body: Center(
                                      child: Text(
                                'Settings',
                              ))),
                            ),
                          ),
                          icon: const Icon(Icons.edit_note_sharp),
                        ),
                      ],
                    ),
                  ),
                ),
                childWhenDragging: Opacity(
                  opacity: .3,
                  child: Container(
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   color: controller.themeMode == ThemeMode.dark
                      //       ? Colors.white10.withAlpha(80)
                      //       : Colors.black.withAlpha(80),
                      // ),
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
                          onPressed: () => widget.controller.updateThemeMode(
                            widget.controller.themeMode == ThemeMode.light
                                ? ThemeMode.dark
                                : ThemeMode.light,
                          ),
                          icon: Builder(
                            builder: (_) {
                              switch (widget.controller.themeMode) {
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
                              builder: (_) => const Scaffold(
                                  body: Center(
                                      child: Text(
                                'Settings',
                              ))),
                            ),
                          ),
                          icon: const Icon(Icons.edit_note_sharp),
                        ),
                      ],
                    ),
                  ),
                ),
                onDragEnd: (details) => updatePosition(details.offset),
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   color: controller.themeMode == ThemeMode.dark
                      //       ? Colors.white10.withAlpha(80)
                      //       : Colors.black.withAlpha(80),
                      // ),
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
                          onPressed: () => widget.controller.updateThemeMode(
                            widget.controller.themeMode == ThemeMode.light
                                ? ThemeMode.dark
                                : ThemeMode.light,
                          ),
                          icon: Builder(
                            builder: (_) {
                              switch (widget.controller.themeMode) {
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
                              builder: (_) => const EditView(),
                            ),
                          ),
                          icon: const Icon(Icons.edit_note_sharp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsWidget extends StatelessWidget {
  final String title;
  final String description;

  const DetailsWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          flex: 4,
          child: description.contains('http')
              //? find a way to know if the image is loading
              ? Image.network(
                  'https://res.cloudinary.com/dbql17dyz/image/upload/v1694251329/profile-pic_geigt8.png',
                )
              : Text(
                  description,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
        ),
      ],
    );
  }
}
