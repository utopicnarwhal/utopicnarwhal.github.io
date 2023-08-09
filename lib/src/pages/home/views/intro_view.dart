import 'package:flutter/material.dart';
import 'package:portfolio/l10n/generated/l10n.dart';
import 'package:portfolio/src/global_widgets/card_plus.dart';
import 'package:portfolio/src/global_widgets/layout/custom_sliver_separated_list.dart';
import 'package:portfolio/src/global_widgets/portfolio_theme/portfolio_theme.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';
import 'package:styled_text/styled_text.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
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
          SliverToBoxAdapter(child: SizedBox(height: edgePadding)),
          CustomSliverSeparatedList(
            everyChildPadding: EdgeInsets.symmetric(horizontal: edgePadding),
            alignment: Alignment.topLeft,
            children: [
              SelectableText(
                Dictums.of(context).introViewGreeting,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Divider(
                thickness: 1,
                height: 32,
                color: Theme.of(context).colorScheme.outline,
              ),
              StyledText.selectable(
                text: Dictums.of(context).introViewMyTitleString,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).hintColor),
                tags: getUnifiedStyledTextTags(context),
              ),
              const SizedBox(height: 60),
              CardPlus(
                padding: EdgeInsets.all(edgePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      'Professional Summary',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    SelectableText(
                      'Experienced mobile developer with 6+ years of dedicated expertise in crafting Android and iOS apps using Flutter and publishing them into the app stores.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // SelectableText( // TODO(sergei): add CV here
              //   'placeholder to download boring CV here',
              //   style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).hintColor),
              // ),
            ],
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 128)),
        ],
      ),
    );
  }
}
