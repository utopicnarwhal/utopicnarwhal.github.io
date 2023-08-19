import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/flutter_gen/assets.gen.dart';
import 'package:portfolio/src/global_widgets/card_plus.dart';
import 'package:portfolio/src/global_widgets/layout/custom_primary_view.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';

class SoftSkillsView extends StatefulWidget {
  const SoftSkillsView({super.key});

  @override
  State<SoftSkillsView> createState() => _SoftSkillsViewState();
}

class _SoftSkillsViewState extends State<SoftSkillsView> {
  @override
  Widget build(BuildContext context) {
    final double edgePadding = context.isSmallScreen ? 20 : 40;

    return CustomPrimaryView(
      edgePadding: edgePadding,
      children: [
        SelectableText(
          'Soft skills',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 20),
        CardPlus(
          padding: EdgeInsets.all(edgePadding),
          child: LottieBuilder.asset(
            Assets.animations.underConstruction,
            repeat: true,
            width: 300,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
