import 'package:flutter/material.dart';

/// Represents the layout size by its width
///
/// They are sorted by size from `tiny` to `extra large`
///
/// Call [ScreenSize.getBreakpoint] to get it for the current [BuildContext]
///
/// {@macro tiny_breakpoint}
///
/// {@macro extra_small_breakpoint}
///
/// {@macro small_breakpoint}
///
/// {@macro medium_breakpoint}
///
/// {@macro large_breakpoint}
///
/// {@macro extra_large_breakpoint}
enum Breakpoint {
  /// {@template tiny_breakpoint}
  /// Tiny < 360
  /// {@endtemplate}
  tn,

  /// {@template extra_small_breakpoint}
  /// Extra small >= 360, < 600
  /// {@endtemplate}
  xs,

  /// {@template small_breakpoint}
  /// Small >= 600, < 1024
  /// {@endtemplate}
  sm,

  /// {@template medium_breakpoint}
  /// Medium >= 1024, < 1440
  /// {@endtemplate}
  md,

  /// {@template large_breakpoint}
  /// Large >= 1440, < 1920
  /// {@endtemplate}
  lg,

  /// {@template extra_large_breakpoint}
  /// Extra large >= 1920
  /// {@endtemplate}
  xl,
}

/// Represents
///
/// Call [ScreenSize.getOrientationType] to get it for the current [BuildContext]
enum OrientationType {
  /// {@template portrait}
  /// screenSize.width / screenSize.height <= 0.75
  /// {@endtemplate}
  portrait,

  /// {@template square}
  /// Screen's aspect ratio > 0.75 and < 1.25
  /// {@endtemplate}
  square,

  /// {@template landscape}
  /// screenSize.width / screenSize.height >= 1.25
  /// {@endtemplate}
  landscape,
}

/// {@template screen_size}
/// An util that used to get a screen size [Breakpoint]
/// {@endtemplate}
abstract class ScreenSize {
  static const _tn = 360;
  static const _xs = 600;
  static const _sm = 1024;
  static const _md = 1440;
  static const _lg = 1920;

  /// Returns current screen size [Breakpoint]
  static Breakpoint getBreakpoint(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return _getBreakpointFromWidth(screenWidth);
  }

  /// Returns current screen's [OrientationType]
  static OrientationType getOrientationType(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    if (screenSize.width / screenSize.height >= 1.25) {
      return OrientationType.landscape;
    } else if (screenSize.width / screenSize.height <= 0.75) {
      return OrientationType.portrait;
    }
    return OrientationType.square;
  }

  static Breakpoint _getBreakpointFromWidth(double availableWidth) {
    if (availableWidth < _tn) {
      return Breakpoint.tn;
    } else if (availableWidth < _xs) {
      return Breakpoint.xs;
    } else if (availableWidth < _sm) {
      return Breakpoint.sm;
    } else if (availableWidth < _md) {
      return Breakpoint.md;
    } else if (availableWidth < _lg) {
      return Breakpoint.lg;
    }

    return Breakpoint.xl;
  }
}

/// Signature for the individual builders (`small`, `medium`, `large`, etc.).
typedef ResponsiveLayoutWidgetBuilder = Widget Function(BuildContext context, Widget? child);

/// {@template responsive_layout_builder}
/// A wrapper around [LayoutBuilder] which exposes builders for
/// various responsive breakpoints.
///
/// If there is no exact breakpoint build function - will call the first larger one.
/// {@endtemplate}
class ResponsiveLayoutBuilder extends StatelessWidget {
  /// {@macro responsive_layout_builder}
  const ResponsiveLayoutBuilder({
    Key? key,
    this.tiny,
    this.extraSmall,
    this.small,
    this.medium,
    this.large,
    required this.extraLarge,
    this.child,
  }) : super(key: key);

  /// [ResponsiveLayoutWidgetBuilder] for tiny layout.
  ///
  /// {@macro tiny_breakpoint}
  final ResponsiveLayoutWidgetBuilder? tiny;

  /// [ResponsiveLayoutWidgetBuilder] for extra small layout.
  ///
  /// {@macro extra_small_breakpoint}
  final ResponsiveLayoutWidgetBuilder? extraSmall;

  /// [ResponsiveLayoutWidgetBuilder] for small layout.
  ///
  /// {@macro small_breakpoint}
  final ResponsiveLayoutWidgetBuilder? small;

  /// [ResponsiveLayoutWidgetBuilder] for medium layout.
  ///
  /// {@macro medium_breakpoint}
  final ResponsiveLayoutWidgetBuilder? medium;

  /// [ResponsiveLayoutWidgetBuilder] for large layout.
  ///
  /// {@macro large_breakpoint}
  final ResponsiveLayoutWidgetBuilder? large;

  /// [ResponsiveLayoutWidgetBuilder] for extra large layout.
  ///
  /// {@macro extra_large_breakpoint}
  final ResponsiveLayoutWidgetBuilder extraLarge;

  /// Optional child widget builder based on the current layout size
  /// which will be passed to the specific size builders
  /// as a way to share/optimize shared layout.
  final Widget Function(Breakpoint breakpoint)? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final breakpoint = ScreenSize.getBreakpoint(context);

        Widget Function(BuildContext, Widget?) builder;

        if (breakpoint.index <= Breakpoint.tn.index && tiny != null) {
          builder = tiny!;
        } else if (breakpoint.index <= Breakpoint.xs.index && extraSmall != null) {
          builder = extraSmall!;
        } else if (breakpoint.index <= Breakpoint.sm.index && small != null) {
          builder = small!;
        } else if (breakpoint.index <= Breakpoint.md.index && medium != null) {
          builder = medium!;
        } else if (breakpoint.index <= Breakpoint.lg.index && large != null) {
          builder = large!;
        } else {
          builder = extraLarge;
        }

        return builder(
          context,
          // Use [Builder] here to pass a context from `builder` to the child's builder method
          Builder(
            builder: (context) {
              return child?.call(breakpoint) ?? const SizedBox();
            },
          ),
        );
      },
    );
  }
}

extension BuildContextExtension on BuildContext {
  bool get isSmallScreen {
    return ScreenSize.getBreakpoint(this).index <= Breakpoint.sm.index;
  }
}
