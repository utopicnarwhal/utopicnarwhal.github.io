import 'package:flutter/material.dart';

class CustomSliverSeparatedList extends StatelessWidget {
  const CustomSliverSeparatedList({
    required this.children,
    this.everyChildPadding,
    this.maxWidth,
    this.separatorSize = 0,
    this.alignment = Alignment.center,
    super.key,
  });

  final List<Widget> children;
  final EdgeInsets? everyChildPadding;
  final double? maxWidth;
  final double separatorSize;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: children.length * 2 - 1,
        semanticIndexCallback: (Widget _, int index) {
          return index.isEven ? index ~/ 2 : null;
        },
        (BuildContext context, int index) {
          final int itemIndex = index ~/ 2;
          late Widget result;

          if (index.isEven) {
            result = children[itemIndex];

            if (everyChildPadding != null) {
              result = Padding(
                padding: everyChildPadding!,
                child: result,
              );
            }

            if (maxWidth != null) {
              result = ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth!),
                child: result,
              );
            }

            Key key = ValueKey(index);
            if (children[itemIndex].key != null && children[itemIndex].key is! GlobalKey) {
              key = children[itemIndex].key!;
            }

            result = Align(
              key: key,
              alignment: alignment,
              child: result,
            );
          } else {
            result = SizedBox(
              key: ValueKey(index),
              height: separatorSize,
              width: separatorSize,
            );
          }

          return result;
        },
      ),
    );
  }
}
