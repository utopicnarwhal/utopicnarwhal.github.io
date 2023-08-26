import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';

class ResponsiveFlex extends StatelessWidget {
  const ResponsiveFlex({required this.children, this.spacing = 20, this.flexes, super.key});

  final double spacing;
  final List<int>? flexes;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final isVertical = context.isExtraSmallScreen;

    return Flex(
      mainAxisSize: isVertical ? MainAxisSize.min : MainAxisSize.max,
      crossAxisAlignment: isVertical ? CrossAxisAlignment.stretch : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      direction: isVertical ? Axis.vertical : Axis.horizontal,
      children: [
        for (int i = 0; i < children.length; ++i) ...[
          Flexible(
            flex: flexes?.elementAtOrNull(i) ?? 1,
            child: children[i],
          ),
          if (i != children.length - 1) SizedBox.square(dimension: spacing),
        ],
      ],
    );
  }
}
