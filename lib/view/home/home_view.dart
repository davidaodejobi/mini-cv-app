// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cv_app/utils/extensions.dart';
import 'package:cv_app/view/home/widget/action_box.dart';
import 'package:cv_app/view/home/widget/details_widget.dart';
import 'package:flutter/material.dart';

import '../../controller/home_controller.dart';

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
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      widget.controller.updateThemeMode(
        widget.controller.themeMode == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light,
      );
    });
    super.initState();
  }

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
                    title: 'Name',
                    description: widget.controller.user.name,
                  ),
                  30.h,
                  DetailsWidget(
                    title: 'Slack Username',
                    description: widget.controller.user.slackUserName,
                  ),
                  30.h,
                  DetailsWidget(
                    title: '',
                    description: widget.controller.user.imageUrl,
                  ),
                  30.h,
                  DetailsWidget(
                    title: 'Bio',
                    description: widget.controller.user.bio,
                  ),
                  30.h,
                ],
              ),
            ),
            Positioned(
              left: position.dx,
              top: position.dy,
              child: Draggable(
                maxSimultaneousDrags: 1,
                feedback: Material(
                  child: ActionBox(
                    controller: widget.controller,
                  ),
                ),
                childWhenDragging: Opacity(
                  opacity: .3,
                  child: ActionBox(
                    controller: widget.controller,
                  ),
                ),
                onDragEnd: (details) => updatePosition(details.offset),
                child: Transform.scale(
                  scale: scale,
                  child: ActionBox(
                    controller: widget.controller,
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
