import 'package:flutter/material.dart';
import 'package:portfolio/flutter_gen/assets.gen.dart';
import 'package:portfolio/l10n/generated/l10n.dart';
import 'package:portfolio/src/common_widgets/compositions/project_preview_card.dart';
import 'package:portfolio/src/common_widgets/compositions/tag_chips_wrap.dart';
import 'package:portfolio/src/common_widgets/compositions/text_passage_card.dart';
import 'package:portfolio/src/design_system/components/card_plus.dart';
import 'package:portfolio/src/design_system/layout/custom_primary_view.dart';
import 'package:portfolio/src/design_system/layout/responsive_flex.dart';
import 'package:portfolio/src/design_system/styles/motion/transitions.dart';
import 'package:portfolio/src/design_system/styles/portfolio_theme.dart';
import 'package:portfolio/src/pages/routes.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';
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
        TextPassageCard(
          title: Dictums.of(context).professionalSummaryTitle,
          body: Dictums.of(context).professionalSummaryCardBodyText,
          footer: Wrap(
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
        ),
        const SizedBox(height: 40),
        SelectableText(
          Dictums.of(context).keySkillsHeadline,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 20),
        ResponsiveFlex(
          children: [
            CardPlus(
              padding: EdgeInsets.all(edgePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SelectableText(
                    Dictums.of(context).hardSkillsTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  TagChipsWrap(
                    strings: [
                      Dictums.of(context).flutterFrameworkTitle,
                      Dictums.of(context).dartProgrammingLanguageHardSkillTitle,
                      Dictums.of(context).versionControlHardSkillTitle,
                      Dictums.of(context).cicdHardSkillTitle,
                      Dictums.of(context).firebaseToolsHardSkillTitle,
                      Dictums.of(context).googleMaterialDesignHardSkillTitle,
                      Dictums.of(context).responsiveDesignHardSkillTitle,
                      Dictums.of(context).designSystemsHardSkillTitle,
                      Dictums.of(context).internationalizationHardSkillTitle,
                      Dictums.of(context).effectsAndAnimationsHardSkillTitle,
                      Dictums.of(context).appDeploymentHardSkillTitle,
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
            CardPlus(
              padding: EdgeInsets.all(edgePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SelectableText(
                    Dictums.of(context).softSkillsTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  TagChipsWrap(
                    strings: [
                      Dictums.of(context).softSkillProblemSolving,
                      Dictums.of(context).softSkillAdaptability,
                      Dictums.of(context).softSkillCommunication,
                      Dictums.of(context).softSkillTeamwork,
                      Dictums.of(context).softSkillTimeManagement,
                      Dictums.of(context).softSkillCreativity,
                      Dictums.of(context).softSkillAttentionToDetail,
                      Dictums.of(context).softSkillInitiative,
                      Dictums.of(context).softSkillOpenMindedness,
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
          ],
        ),
        const SizedBox(height: 40),
        SelectableText(
          Dictums.of(context).projectsShowcaseHeadline,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 20),
        ResponsiveFlex(
          children: [
            ProjectPreviewCard(
              onTap: () => FreskaCustomerAppProjectRoute().go(context),
              mediaAspectRatio: 890 / 544,
              title: Dictums.of(context).freskaCustomerAppName,
              medias: [
                Image.asset(
                  Assets.images.illustrations.freskaApp.preview.path,
                  key: ValueKey(Assets.images.illustrations.freskaApp.preview.hashCode),
                  frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => frame != null
                      ? child
                      : SkeletonAnimationConfiguration.staggeredList(
                          position: 1,
                          isLoading: true,
                          child: SkeletonLoader(child: Container()),
                        ),
                ),
                Image.asset(
                  Assets.images.illustrations.freskaApp.preview2.path,
                  key: ValueKey(Assets.images.illustrations.freskaApp.preview2.hashCode),
                  frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => frame != null
                      ? child
                      : SkeletonAnimationConfiguration.staggeredList(
                          position: 1,
                          isLoading: true,
                          child: SkeletonLoader(child: Container()),
                        ),
                ),
              ],
            ),
            ProjectPreviewCard(
              onTap: () => FreskaServiceWorkersAppProjectRoute().go(context),
              mediaAspectRatio: 1780 / 1088,
              title: Dictums.of(context).freskaProAppName,
              medias: [
                Image.asset(
                  Assets.images.illustrations.freskaProApp.preview.path,
                  key: ValueKey(Assets.images.illustrations.freskaProApp.preview.hashCode),
                  frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => frame != null
                      ? child
                      : SkeletonAnimationConfiguration.staggeredList(
                          position: 1,
                          isLoading: true,
                          child: SkeletonLoader(child: Container()),
                        ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
