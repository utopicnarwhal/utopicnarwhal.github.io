import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/design_system/styles/motion/easing_and_durations.dart';
import 'package:rxdart/rxdart.dart';

class ImageHoverSwitcher extends StatefulWidget {
  const ImageHoverSwitcher({required this.regularImageAssetPath, required this.hoverImageAssetPath, super.key});

  final String regularImageAssetPath;
  final String hoverImageAssetPath;

  @override
  State<ImageHoverSwitcher> createState() => _ImageHoverSwitcherState();
}

class _ImageHoverSwitcherState extends State<ImageHoverSwitcher> with SingleTickerProviderStateMixin {
  late BehaviorSubject<bool> _hoverController;
  late AnimationController _controller;
  late Animation<double> _regularChildOpacityAnimation;
  late Animation<double> _hoverChildOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _hoverController = BehaviorSubject.seeded(false)
      ..listen((value) {
        if (value) {
          _controller.animateTo(1, curve: MaterialEasing.standardAccelerate);
        } else {
          _controller.animateBack(0, curve: MaterialEasing.standardAccelerate);
        }
      });
    _controller = AnimationController(
      vsync: this,
      duration: MaterialDurations.medium2,
    );
    _regularChildOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(_controller);
    _hoverChildOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _hoverController.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: MouseCursor.defer,
      onTap: () {},
      onHover: _hoverController.add,
      splashFactory: NoSplash.splashFactory,
      canRequestFocus: false,
      onTapUp: (eventDetails) {
        if (eventDetails.kind == PointerDeviceKind.touch) {
          _hoverController.add(false);
        }
      },
      onTapDown: (eventDetails) {
        if (eventDetails.kind == PointerDeviceKind.touch) {
          _hoverController.add(true);
        }
      },
      onTapCancel: () {
        _hoverController.add(false);
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Both of the children should be onstage to prevent flickering when image loads
          Image.asset(
            widget.regularImageAssetPath,
            opacity: _regularChildOpacityAnimation,
          ),
          Image.asset(
            widget.hoverImageAssetPath,
            opacity: _hoverChildOpacityAnimation,
          ),
        ],
      ),
    );
  }
}
