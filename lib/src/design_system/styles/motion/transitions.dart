import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/design_system/styles/motion/easing_and_durations.dart';
import 'package:portfolio/src/design_system/components/card_plus.dart';

part 'skeleton_loader.dart';

class ForwardAndBackwardTransition extends StatelessWidget {
  const ForwardAndBackwardTransition({
    required this.index,
    required this.reverse,
    required this.children,
    this.layoutBuilderAlignment = Alignment.center,
    super.key,
  });

  final bool reverse;
  final int index;
  final Alignment layoutBuilderAlignment;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    if (index < 0 || index >= children.length) {
      return const Text("index < 0 OR index >= children.length");
    }

    return PageTransitionSwitcher(
      reverse: reverse,
      duration: MaterialDurations.long4,
      layoutBuilder: (entries) {
        return Stack(
          alignment: layoutBuilderAlignment,
          children: entries,
        );
      },
      transitionBuilder: (Widget child, Animation<double> animation, Animation<double> secondaryAnimation) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          fillColor: Colors.transparent,
          child: child,
        );
      },
      child: children[index],
    );
  }
}

class TopLevelTransition extends StatelessWidget {
  const TopLevelTransition({
    required this.index,
    required this.children,
    this.layoutBuilderAlignment = Alignment.center,
    this.duration = MaterialDurations.medium4,
    super.key,
  });

  final int index;
  final Alignment layoutBuilderAlignment;
  final List<Widget> children;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    if (index < 0 || index >= children.length) {
      return const Text("index < 0 OR index >= children.length");
    }

    return PageTransitionSwitcher(
      duration: duration,
      layoutBuilder: (entries) {
        return Stack(
          alignment: layoutBuilderAlignment,
          children: entries,
        );
      },
      transitionBuilder: (Widget child, Animation<double> animation, Animation<double> secondaryAnimation) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          fillColor: Colors.transparent,
          child: child,
        );
      },
      child: children[index],
    );
  }
}
