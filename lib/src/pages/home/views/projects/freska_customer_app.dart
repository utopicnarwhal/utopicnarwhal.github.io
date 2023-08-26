import 'package:flutter/material.dart';
import 'package:portfolio/flutter_gen/assets.gen.dart';
import 'package:portfolio/src/design_system/components/card_plus.dart';
import 'package:portfolio/src/design_system/layout/custom_primary_view.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';
import 'package:rive/rive.dart';

class FreskaCustomerAppView extends StatefulWidget {
  const FreskaCustomerAppView({super.key});

  @override
  State<FreskaCustomerAppView> createState() => _FreskaCustomerAppViewState();
}

class _FreskaCustomerAppViewState extends State<FreskaCustomerAppView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double edgePadding = context.isSmallScreen ? 20 : 40;

    return CustomPrimaryView(
      edgePadding: edgePadding,
      children: [
        SelectableText(
          'Freska app',
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
