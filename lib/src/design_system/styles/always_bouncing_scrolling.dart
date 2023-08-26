import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// iOS scroll physics but also always scrollable to make it look more interactive
const kAlwaysBouncingScrollPhysics = BouncingScrollPhysics(
  parent: AlwaysScrollableScrollPhysics(),
);

class AlwaysBouncingScrollBehavior extends CupertinoScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(context) {
    // Do not add always scrollable property if the scrolling is inside SelectableText coz it makes all SelectableTexts be always scrollable
    if (context.findAncestorWidgetOfExactType<SelectableText>() == null) {
      return kAlwaysBouncingScrollPhysics;
    }
    return const BouncingScrollPhysics();
  }

  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    assert(details.controller != null);
    return CupertinoScrollbar(
      controller: details.controller,
      thumbVisibility: true,
      child: child,
    );
  }
}
