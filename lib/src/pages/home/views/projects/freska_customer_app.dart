import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/flutter_gen/assets.gen.dart';
import 'package:portfolio/src/global_widgets/card_plus.dart';
import 'package:portfolio/src/global_widgets/layout/custom_sliver_separated_list.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';

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

    return Scrollbar(
      controller: _scrollController,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          CustomSliverSeparatedList(
            separatorSize: 20,
            maxWidth: 560,
            everyChildPadding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              SelectableText(
                'Freska app',
                style: Theme.of(context).textTheme.displayMedium,
              ),
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
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 128)),
        ],
      ),
    );
  }
}
