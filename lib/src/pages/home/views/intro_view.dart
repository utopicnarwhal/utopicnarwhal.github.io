import 'package:flutter/material.dart';
import 'package:portfolio/l10n/generated/l10n.dart';
import 'package:portfolio/src/global_widgets/card_plus.dart';
import 'package:portfolio/src/global_widgets/effects.dart';
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
            maxWidth: context.isExtraLargeScreen ? 900 : null,
            alignment: context.isExtraLargeScreen ? Alignment.topCenter : Alignment.topLeft,
            children: [
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(),
                  1: FixedColumnWidth(20),
                  2: FixedColumnWidth(200),
                },
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                              style:
                                  Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).hintColor),
                              tags: getUnifiedStyledTextTags(context),
                            ),
                          ],
                        ),
                      ),
                      if (!context.isExtraSmallScreen) ...[
                        const TableCell(child: SizedBox()),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.top,
                          child: Image.network(
                            'https://avatars.githubusercontent.com/u/8808766?v=4',
                            alignment: Alignment.topCenter,
                            loadingBuilder: (context, child, loadingProgress) {
                              return SkeletonAnimationConfiguration.staggeredList(
                                position: 0,
                                isLoading: loadingProgress != null &&
                                    loadingProgress.cumulativeBytesLoaded != loadingProgress.expectedTotalBytes,
                                child: SkeletonLoader(child: child),
                              );
                            },
                            frameBuilder: (context, child, _, __) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(kCardBorderRadius),
                                child: child,
                              );
                            },
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (context.isExtraSmallScreen) ...[
                    const TableRow(children: [TableCell(child: SizedBox(height: 20))]),
                    TableRow(
                      children: [
                        TableCell(
                          child: Image.network(
                            'https://avatars.githubusercontent.com/u/8808766?v=4',
                            loadingBuilder: (context, child, loadingProgress) {
                              return SkeletonAnimationConfiguration.staggeredList(
                                position: 0,
                                isLoading: loadingProgress != null &&
                                    loadingProgress.cumulativeBytesLoaded != loadingProgress.expectedTotalBytes,
                                child: SkeletonLoader(
                                  child: child,
                                ),
                              );
                            },
                            frameBuilder: (context, child, _, __) {
                              return AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(kCardBorderRadius),
                                  child: child,
                                ),
                              );
                            },
                            alignment: Alignment.topLeft,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 40),
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
                      'Experienced mobile developer with 6+ years of dedicated expertise in crafting Android, iOS, and Web apps using Flutter and publishing them into the app stores. Committed to creating top-notch applications by prioritizing clean, readable code and exceptional user experiences.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: StyledText.selectable(
                  text: 'Looking for CV? You can find it <link href="sergei_danilov_CV.pdf">here</link>',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).hintColor),
                  tags: getUnifiedStyledTextTags(context),
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
