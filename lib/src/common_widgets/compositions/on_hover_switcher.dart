import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/design_system/styles/motion/easing_and_durations.dart';
import 'package:rxdart/rxdart.dart';

class OnHoverSwitcher extends StatefulWidget {
  const OnHoverSwitcher({required this.regularChild, required this.hoverChild, super.key});

  final Widget regularChild;
  final Widget hoverChild;

  @override
  State<OnHoverSwitcher> createState() => _OnHoverSwitcherState();
}

class _OnHoverSwitcherState extends State<OnHoverSwitcher> {
  late BehaviorSubject<bool> _hoverController;

  @override
  void initState() {
    super.initState();
    _hoverController = BehaviorSubject.seeded(false);
  }

  @override
  void dispose() {
    _hoverController.close();
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
      child: StreamBuilder<bool>(
        initialData: _hoverController.value,
        stream: _hoverController,
        builder: (context, hoverSnapshot) {
          return AnimatedCrossFade(
            firstChild: widget.regularChild,
            secondChild: widget.hoverChild,
            crossFadeState: hoverSnapshot.data == true ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: MaterialDurations.medium2,
            firstCurve: MaterialEasing.standardAccelerate,
            secondCurve: MaterialEasing.standardAccelerate,
            alignment: Alignment.center,
            layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
              return Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  KeyedSubtree(
                    key: bottomChildKey,
                    child: bottomChild,
                  ),
                  KeyedSubtree(
                    key: topChildKey,
                    child: topChild,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
