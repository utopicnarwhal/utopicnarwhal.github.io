import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/global_widgets/card_plus.dart';

abstract class MaterialDurations {
  // https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#97194be9-de1c-41b9-90d4-21ae2b8d3f38
  /// 50 milliseconds
  static const short1 = Duration(milliseconds: 50);

  /// 100 milliseconds
  static const short2 = Duration(milliseconds: 100);

  /// 150 milliseconds
  static const short3 = Duration(milliseconds: 150);

  /// 200 milliseconds
  static const short4 = Duration(milliseconds: 200);

  // https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#e08d2356-1831-4375-bc2f-6d45230c6d98
  /// 250 milliseconds
  static const medium1 = Duration(milliseconds: 250);

  /// 300 milliseconds
  static const medium2 = Duration(milliseconds: 300);

  /// 350 milliseconds
  static const medium3 = Duration(milliseconds: 350);

  /// 400 milliseconds
  static const medium4 = Duration(milliseconds: 400);

  // https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#48bf653e-46f9-48f5-87e0-eaf8ea3fe716
  /// 450 milliseconds
  static const long1 = Duration(milliseconds: 450);

  /// 500 milliseconds
  static const long2 = Duration(milliseconds: 500);

  /// 550 milliseconds
  static const long3 = Duration(milliseconds: 550);

  /// 600 milliseconds
  static const long4 = Duration(milliseconds: 600);

  // https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#ee9dbe95-70fa-4804-8347-c4fd58c60fe2
  /// 700 milliseconds
  static const extraLong1 = Duration(milliseconds: 700);

  /// 800 milliseconds
  static const extraLong2 = Duration(milliseconds: 800);

  /// 900 milliseconds
  static const extraLong3 = Duration(milliseconds: 900);

  /// 1000 milliseconds
  static const extraLong4 = Duration(milliseconds: 1000);
}

abstract class MaterialEasing {
  // https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#cbea5c6e-7b0d-47a0-98c3-767080a38d95
  static const emphasized = Curves.easeInOutCubicEmphasized;
  static const emphasizedDecelerate = Cubic(0.05, 0.7, 0.1, 1.0);
  static const emphasizedAccelerate = Cubic(0.3, 0.0, 0.8, 0.15);

  // https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#2639a6e2-9007-4bca-b44a-f398b6a69382
  static const standard = Cubic(0.2, 0.0, 0, 1.0);
  static const standardDecelerate = Cubic(0, 0, 0, 1);
  static const standardAccelerate = Cubic(0.3, 0, 1, 1);
}

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

class SkeletonLoader extends StatefulWidget {
  /// The child Widget to cover with the skeleton loader.
  final Widget child;

  /// Shape of the skeleton card
  final ShapeBorder? skeletonCardShape;

  /// The layout builder's [Stack] alignment
  final Alignment layoutBuilderAlignment;

  /// Elevation of the skeleton placeholder card. Default is taken from the card's theme
  final int? surfaceLevel;

  /// Creates a fade animation that fades its child.
  ///
  /// The [child] argument must not be null.
  const SkeletonLoader({
    super.key,
    this.skeletonCardShape,
    this.surfaceLevel,
    this.layoutBuilderAlignment = Alignment.center,
    required this.child,
  });

  @override
  State<SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader> {
  @override
  Widget build(BuildContext context) {
    if (widget.child is SizedBox && (widget.child as SizedBox).child == null) {
      return widget.child;
    }

    final isLoading = SkeletonAnimationConfiguration.of(context)?.isLoading == true;

    return Stack(
      alignment: widget.layoutBuilderAlignment,
      children: [
        AnimatedOpacity(
          opacity: isLoading ? 0 : 1,
          duration: MaterialDurations.medium4,
          curve: MaterialEasing.standard,
          child: widget.child,
        ),
        Positioned.fill(
          key: const ValueKey('skeleton_loader_curtain'),
          child: AnimatedSwitcher(
            duration: MaterialDurations.medium4,
            switchInCurve: MaterialEasing.standard,
            switchOutCurve: MaterialEasing.standard,
            layoutBuilder: (currentChild, previousChildren) {
              return Stack(
                alignment: widget.layoutBuilderAlignment,
                children: [
                  ...previousChildren,
                  if (currentChild != null) currentChild,
                ],
              );
            },
            child: isLoading
                ? _SkeletonAnimationConfigurator(animatedChildBuilder: _skeletonLoadingAnimation)
                : const SizedBox(),
          ),
        ),
      ],
    );
  }

  Widget _skeletonLoadingAnimation(Animation<double> animation) {
    final opacityAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(1),
        weight: 5,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 0.4).chain(CurveTween(curve: MaterialEasing.emphasized)),
        weight: 45,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.4, end: 1).chain(CurveTween(curve: MaterialEasing.emphasized)),
        weight: 45,
      ),
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(1),
        weight: 5,
      ),
    ]).animate(animation);

    EdgeInsetsGeometry? placeholderMargin;
    if (widget.child is Card) {
      placeholderMargin = (widget.child as Card).margin;
    } else if (widget.child is CardPlus) {
      placeholderMargin = (widget.child as CardPlus).margin;
    } else if (widget.child is Padding) {
      placeholderMargin = (widget.child as Padding).padding;
    } else if (widget.child is Container) {
      placeholderMargin = (widget.child as Container).margin;
    }

    return Opacity(
      opacity: opacityAnimation.value,
      child: CardPlus(
        margin: placeholderMargin,
        shape: widget.skeletonCardShape,
        surfaceLevel: widget.surfaceLevel,
        child: Container(),
      ),
    );
  }
}

/// [SkeletonAnimationConfiguration] provides the configuration used as a base for every children Animation.
/// Configuration made in [SkeletonAnimationConfiguration] can be overridden in Animation children if needed.
///
/// Depending on the scenario in which you will present your animations,
/// you should use one of [SkeletonAnimationConfiguration]'s named constructors.
///
/// [SkeletonAnimationConfiguration.synchronized] if you want to launch all the children's animations at the same time.
///
/// [SkeletonAnimationConfiguration.staggeredList] if you want to delay the animation of each child
/// to produce a single-axis staggered animations (from top to bottom or from left to right).
///
/// [SkeletonAnimationConfiguration.staggeredGrid] if you want to delay the animation of each child
/// to produce a dual-axis staggered animations (from left to right and top to bottom).
class SkeletonAnimationConfiguration extends InheritedWidget {
  /// Index used as a factor to calculate the delay of each child's animation.
  final int position;

  /// Shoud the skeleton loading be shown or not
  final bool isLoading;

  /// The column count of the grid
  final int columnCount;

  /// Configure the children's animation to be synchronized (all the children's animation start at the same time).
  ///
  /// The [child] argument must not be null.
  const SkeletonAnimationConfiguration.synchronized({
    Key? key,
    required this.isLoading,
    required Widget child,
  })  : position = 0,
        columnCount = 1,
        super(key: key, child: child);

  /// Configure the children's animation to be staggered.
  ///
  /// A staggered animation consists of sequential or overlapping animations.
  ///
  /// Each child animation will start with a delay based on its position comparing to previous children.
  ///
  /// The staggering effect will be based on a single axis (from top to bottom or from left to right).
  ///
  /// Use this named constructor to display a staggered animation on a single-axis list of widgets
  /// ([ListView], [ScrollView], [Column], [Row]...).
  ///
  /// The [position] argument must not be null.
  ///
  /// The [child] argument must not be null.
  const SkeletonAnimationConfiguration.staggeredList({
    Key? key,
    required this.position,
    required this.isLoading,
    required Widget child,
  })  : columnCount = 1,
        super(key: key, child: child);

  /// Configure the children's animation to be staggered.
  ///
  /// A staggered animation consists of sequential or overlapping animations.
  ///
  /// Each child animation will start with a delay based on its position comparing to previous children.
  ///
  /// The staggering effect will be based on a dual-axis (from left to right and top to bottom).
  ///
  /// Use this named constructor to display a staggered animation on a dual-axis list of widgets
  /// ([GridView]...).
  ///
  /// The [position] argument must not be null.
  ///
  /// The [columnCount] argument must not be null and must be greater than 0.
  ///
  /// The [child] argument must not be null.
  const SkeletonAnimationConfiguration.staggeredGrid({
    Key? key,
    required this.position,
    required this.isLoading,
    required this.columnCount,
    required Widget child,
  }) : super(key: key, child: child);

  /// Helper method to apply a staggered animation to the children of a [Column] or [Row].
  ///
  /// It maps every child with an index and calls
  /// [SkeletonAnimationConfiguration.staggeredList] constructor under the hood.
  ///
  /// The [children] argument must not be null.
  /// It corresponds to the children you would normally have passed to the [Column] or [Row].
  static List<Widget> toStaggeredList({
    required bool isLoading,
    required List<Widget> children,
  }) {
    return children
        .asMap()
        .map((index, widget) {
          return MapEntry(
            index,
            SkeletonAnimationConfiguration.staggeredList(
              key: widget.key,
              isLoading: isLoading,
              position: index,
              child: widget,
            ),
          );
        })
        .values
        .toList();
  }

  static SkeletonAnimationConfiguration? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SkeletonAnimationConfiguration>();
  }

  @override
  bool updateShouldNotify(SkeletonAnimationConfiguration oldWidget) {
    return oldWidget.isLoading != isLoading || oldWidget.position != position || oldWidget.columnCount != columnCount;
  }
}

class _SkeletonAnimationConfigurator extends StatelessWidget {
  final Widget Function(Animation<double>) animatedChildBuilder;

  const _SkeletonAnimationConfigurator({
    Key? key,
    required this.animatedChildBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationConfiguration = SkeletonAnimationConfiguration.of(context);

    final aPosition = animationConfiguration?.position ?? 0;
    final aColumnCount = animationConfiguration?.columnCount ?? 1;

    if (aPosition < 0) {
      return const Text('Exception: aPosition < 0');
    }
    if (aColumnCount < 1) {
      return const Text('Exception: aColumnCount < 1');
    }

    return _SkeletonAnimationExecutor(
      additionalAnimationDelay: aPosition ~/ aColumnCount + aPosition % aColumnCount,
      builder: (context, animationController) => animatedChildBuilder(animationController!),
    );
  }
}

class _SkeletonAnimationExecutor extends StatefulWidget {
  /// Delay before starting the loading animation;
  final int additionalAnimationDelay;

  final Widget Function(BuildContext context, AnimationController? animationController) builder;

  const _SkeletonAnimationExecutor({
    Key? key,
    required this.builder,
    this.additionalAnimationDelay = 0,
  }) : super(key: key);

  @override
  State<_SkeletonAnimationExecutor> createState() => _SkeletonAnimationExecutorState();
}

class _SkeletonAnimationExecutorState extends State<_SkeletonAnimationExecutor> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    final duration = MaterialDurations.extraLong2 * 2;
    _animationController = AnimationController(
      duration: duration,
      vsync: this,
    );
    Future.delayed(MaterialDurations.long1 + (MaterialDurations.short2 * widget.additionalAnimationDelay), () {
      if (mounted) {
        _animationController.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: _animationController,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return widget.builder(context, _animationController);
  }
}
