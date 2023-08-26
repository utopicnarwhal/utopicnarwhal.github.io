import 'package:flutter/material.dart';
import 'package:portfolio/src/design_system/styles/portfolio_theme.dart';

/// This class has everything that the default [Card] has. But also it has predefined [addOutline] param
/// and [InkWell] for handling gestures
class CardPlus extends StatelessWidget {
  const CardPlus({
    super.key,
    required this.child,
    this.addOutline = false,
    this.color,
    this.surfaceLevel,
    this.onTap,
    this.onLongPress,
    this.shape,
    this.margin,
    this.padding,
    this.addElevationShadow = false,
  });

  final Widget child;
  final bool addOutline;
  final bool addElevationShadow;
  final Color? color;
  final int? surfaceLevel;
  final Function()? onTap;
  final Function()? onLongPress;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    var child = this.child;

    if (padding != null) {
      child = Padding(
        padding: padding!,
        child: child,
      );
    }

    if (onTap != null || onLongPress != null) {
      child = InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: child,
      );
    }

    var shape = this.shape ?? Theme.of(context).cardTheme.shape;
    if (shape != null && shape is OutlinedBorder && addOutline) {
      shape = shape.copyWith(side: BorderSide(color: Theme.of(context).dividerColor));
    }

    double elevation = surfaceLevel != null
        ? surfaceLevelToElevation(surfaceLevel!)
        : (addOutline ? 0 : (Theme.of(context).cardTheme.elevation ?? 0));

    child = Card(
      color: color ?? Theme.of(context).colorScheme.applyTintToSurface(elevation),
      clipBehavior: Clip.hardEdge,
      shape: shape,
      shadowColor: Colors.transparent,
      margin: margin,
      elevation: addElevationShadow ? elevation : 0,
      child: child,
    );

    return child;
  }
}
