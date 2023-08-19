import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/flutter_gen/assets.gen.dart';
import 'package:portfolio/l10n/generated/l10n.dart';
import 'package:portfolio/src/global_widgets/card_plus.dart';
import 'package:portfolio/src/global_widgets/effects.dart';
import 'package:portfolio/src/global_widgets/layout/custom_primary_view.dart';
import 'package:portfolio/src/global_widgets/portfolio_theme/portfolio_theme.dart';
import 'package:portfolio/src/pages/routes.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';
import 'package:rive/rive.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

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

    return CustomPrimaryView(
      edgePadding: edgePadding,
      children: [
        Flex(
          mainAxisSize: context.isExtraSmallScreen ? MainAxisSize.min : MainAxisSize.max,
          crossAxisAlignment: context.isExtraSmallScreen ? CrossAxisAlignment.stretch : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: context.isExtraSmallScreen ? Axis.vertical : Axis.horizontal,
          children: [
            Flexible(
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
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).hintColor),
                    tags: getUnifiedStyledTextTags(context),
                  ),
                ],
              ),
            ),
            SizedBox.square(dimension: edgePadding),
            SizedBox.square(
              dimension: context.isExtraSmallScreen ? null : 200,
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
        const SizedBox(height: 40),
        CardPlus(
          padding: EdgeInsets.all(edgePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SelectableText(
                Dictums.of(context).professionalSummaryTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              SelectableText(
                Dictums.of(context).professionalSummaryCardBodyText,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                alignment: WrapAlignment.end,
                children: [
                  ActionChip(
                    avatar: const Icon(Icons.description_rounded),
                    label: Text(Dictums.of(context).openCvButton),
                    onPressed: () {
                      url_launcher.launchUrl(
                        Uri.parse('${Uri.base}sergei_danilov_CV.pdf'),
                        mode: url_launcher.LaunchMode.externalApplication,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        SelectableText(
          Dictums.of(context).keySkillsHeadline,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 20),
        Flex(
          mainAxisSize: context.isExtraSmallScreen ? MainAxisSize.min : MainAxisSize.max,
          crossAxisAlignment: context.isExtraSmallScreen ? CrossAxisAlignment.stretch : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: context.isExtraSmallScreen ? Axis.vertical : Axis.horizontal,
          children: [
            Flexible(
              child: CardPlus(
                padding: EdgeInsets.all(edgePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SelectableText(
                      Dictums.of(context).hardSkillsTitle,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20),
                    WrapSuper(
                      spacing: 8,
                      lineSpacing: 8,
                      children: [
                        for (var skillName in [
                          'Flutter SDK',
                          'Dart lang',
                          'Git',
                          'CI/CD',
                          'Firebase',
                          'Material Design',
                          'Responsive Design',
                          'Design Systems',
                          'Internationalization (i18n)',
                          'Automated Testing',
                          'Performance Optimization',
                          'Effects and Animations',
                          'App Deployment',
                        ])
                          Material(
                            color: Colors.transparent,
                            shape: StadiumBorder(
                              side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant, width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 4, 8, 4),
                              child: SelectableText(
                                skillName,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(color: Theme.of(context).hintColor),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      alignment: WrapAlignment.end,
                      children: [
                        ActionChip(
                          avatar: const Icon(Icons.keyboard_double_arrow_right_outlined),
                          label: Text(Dictums.of(context).learnMoreButton),
                          onPressed: () {
                            const HardSkillsRoute().go(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox.square(dimension: edgePadding),
            Flexible(
              child: CardPlus(
                padding: EdgeInsets.all(edgePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SelectableText(
                      Dictums.of(context).softSkillsTitle,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20),
                    WrapSuper(
                      spacing: 8,
                      lineSpacing: 8,
                      children: [
                        for (var skillName in [
                          Dictums.of(context).softSkillProblemSolving,
                          Dictums.of(context).softSkillAdaptability,
                          Dictums.of(context).softSkillCommunication,
                          Dictums.of(context).softSkillTeamwork,
                          Dictums.of(context).softSkillTimeManagement,
                          Dictums.of(context).softSkillCreativity,
                          Dictums.of(context).softSkillAttentionToDetail,
                          Dictums.of(context).softSkillCriticalThinking,
                          Dictums.of(context).softSkillInitiative,
                          Dictums.of(context).softSkillLeadership,
                          Dictums.of(context).softSkillConflictResolution,
                          Dictums.of(context).softSkillClientFocused,
                          Dictums.of(context).softSkillOpenMindedness,
                        ])
                          Material(
                            color: Colors.transparent,
                            shape: StadiumBorder(
                              side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant, width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 4, 8, 4),
                              child: SelectableText(
                                skillName,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(color: Theme.of(context).hintColor),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      alignment: WrapAlignment.end,
                      children: [
                        ActionChip(
                          avatar: const Icon(Icons.keyboard_double_arrow_right_outlined),
                          label: Text(Dictums.of(context).learnMoreButton),
                          onPressed: () {
                            const SoftSkillsRoute().go(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        SelectableText(
          'Projects',
          style: Theme.of(context).textTheme.headlineLarge,
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
