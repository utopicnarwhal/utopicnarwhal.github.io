import 'package:flutter/material.dart';
import 'package:portfolio/flutter_gen/assets.gen.dart';
import 'package:portfolio/src/global_widgets/card_plus.dart';
import 'package:portfolio/src/global_widgets/layout/custom_primary_view.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';
import 'package:rive/rive.dart';

class FreskaServiceWorkersAppView extends StatefulWidget {
  const FreskaServiceWorkersAppView({super.key});

  @override
  State<FreskaServiceWorkersAppView> createState() => _FreskaServiceWorkersAppViewState();
}

class _FreskaServiceWorkersAppViewState extends State<FreskaServiceWorkersAppView> {
  @override
  Widget build(BuildContext context) {
    final double edgePadding = context.isSmallScreen ? 20 : 40;

    return CustomPrimaryView(
      edgePadding: edgePadding,
      children: [
        SelectableText(
          'Freska Pro app',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 20),
        CardPlus(
          padding: EdgeInsets.all(edgePadding),
          child: SizedBox.square(
            dimension: 200,
            child: RiveAnimation.asset(
              Assets.animations.underConstruction,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }
}