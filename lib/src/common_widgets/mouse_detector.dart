import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MouseDetector extends StatefulWidget {
  const MouseDetector({
    required this.builder,
    this.child,
    super.key,
  });

  final Widget? child;
  final Widget Function(BuildContext, bool, Widget?) builder;

  @override
  State<MouseDetector> createState() => _MouseDetectorState();
}

class _MouseDetectorState extends State<MouseDetector> {
  late BehaviorSubject<bool> _isMouseDetectedController;

  @override
  void initState() {
    super.initState();
    _isMouseDetectedController = BehaviorSubject.seeded(false);
  }

  @override
  void dispose() {
    _isMouseDetectedController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: _isMouseDetectedController.value,
      stream: _isMouseDetectedController,
      builder: (context, isMouseDetectedSnapshot) {
        return MouseRegion(
          hitTestBehavior: HitTestBehavior.translucent,
          onHover: (event) {
            if (isMouseDetectedSnapshot.data == false && event.kind == PointerDeviceKind.mouse) {
              _isMouseDetectedController.add(true);
            }
            if (isMouseDetectedSnapshot.data == true && event.kind == PointerDeviceKind.touch) {
              _isMouseDetectedController.add(false);
            }
          },
          child: widget.builder(context, isMouseDetectedSnapshot.data ?? false, widget.child),
        );
      },
    );
  }
}
