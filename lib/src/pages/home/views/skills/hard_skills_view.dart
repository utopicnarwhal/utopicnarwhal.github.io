import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/flutter_gen/assets.gen.dart';
import 'package:portfolio/l10n/generated/l10n.dart';
import 'package:portfolio/src/global_widgets/buttons/custom_icon_button.dart';
import 'package:portfolio/src/global_widgets/card_plus.dart';
import 'package:portfolio/src/global_widgets/effects.dart';
import 'package:portfolio/src/global_widgets/layout/custom_primary_view.dart';
import 'package:portfolio/src/global_widgets/layout/responsive_flex.dart';
import 'package:portfolio/src/global_widgets/portfolio_theme/portfolio_theme.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';
import 'package:rive/rive.dart' as rive;
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:video_player/video_player.dart';
import 'package:video_player_platform_interface/video_player_platform_interface.dart' show VideoPlayerWebOptions;

class HardSkillsView extends StatefulWidget {
  const HardSkillsView({super.key});

  @override
  State<HardSkillsView> createState() => _HardSkillsViewState();
}

class _HardSkillsViewState extends State<HardSkillsView> {
  late VideoPlayerController _flutterDevVideoPlayerController;
  late Future<void> _flutterDevVideoPlayerInitializationFuture;
  late VideoPlayerController _responsiveLayoutVideoPlayerController;
  late Future<void> _responsiveLayoutVideoPlayerInitializationFuture;
  late VideoPlayerController _firebaseHeroVideoPlayerController;
  late Future<void> _firebaseHeroVideoPlayerInitializationFuture;

  @override
  void initState() {
    super.initState();
    _flutterDevVideoPlayerController = VideoPlayerController.asset(
      Assets.videos.flutterDeveloping,
      videoPlayerOptions: VideoPlayerOptions(webOptions: const VideoPlayerWebOptions(allowRemotePlayback: false)),
    );
    _flutterDevVideoPlayerInitializationFuture = _flutterDevVideoPlayerController.initialize().then((_) async {
      Future.wait([
        _flutterDevVideoPlayerController.setLooping(true),
        // Attempts to start playing videos with an audio track (or not muted) without user interaction with the site ("user activation") will be prohibited by the browser and cause runtime errors in JS.
        _flutterDevVideoPlayerController.setVolume(0),
      ]);
    });
    _responsiveLayoutVideoPlayerController = VideoPlayerController.asset(
      Assets.videos.responsiveLayout,
      videoPlayerOptions: VideoPlayerOptions(webOptions: const VideoPlayerWebOptions(allowRemotePlayback: false)),
    );
    _responsiveLayoutVideoPlayerInitializationFuture =
        _responsiveLayoutVideoPlayerController.initialize().then((_) async {
      Future.wait([
        _responsiveLayoutVideoPlayerController.setLooping(true),
        // Attempts to start playing videos with an audio track (or not muted) without user interaction with the site ("user activation") will be prohibited by the browser and cause runtime errors in JS.
        _responsiveLayoutVideoPlayerController.setVolume(0),
      ]);
    });
    _firebaseHeroVideoPlayerController = VideoPlayerController.asset(
      Assets.videos.firebaseHeroLoop,
      videoPlayerOptions: VideoPlayerOptions(webOptions: const VideoPlayerWebOptions(allowRemotePlayback: false)),
    );
    _firebaseHeroVideoPlayerInitializationFuture = _firebaseHeroVideoPlayerController.initialize().then((_) async {
      Future.wait([
        _firebaseHeroVideoPlayerController.setLooping(true),
        // Attempts to start playing videos with an audio track (or not muted) without user interaction with the site ("user activation") will be prohibited by the browser and cause runtime errors in JS.
        _firebaseHeroVideoPlayerController.setVolume(0),
      ]);
    });
  }

  @override
  void dispose() {
    _flutterDevVideoPlayerInitializationFuture.ignore();
    _flutterDevVideoPlayerController.dispose();
    _responsiveLayoutVideoPlayerInitializationFuture.ignore();
    _responsiveLayoutVideoPlayerController.dispose();
    _firebaseHeroVideoPlayerInitializationFuture.ignore();
    _firebaseHeroVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double edgePadding = context.isSmallScreen ? 20 : 40;

    return CustomPrimaryView(
      edgePadding: edgePadding,
      children: [
        SelectableText(
          Dictums.of(context).hardSkillsTitle,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 20),
        ResponsiveFlex(
          children: [
            const _DescriptionCard(
              title: 'Flutter Framework',
              body:
                  'Proficiency in building mobile applications using the Flutter framework, including knowledge of widgets, animations, and UI components.',
            ),
            FutureBuilder(
              future: _flutterDevVideoPlayerInitializationFuture,
              builder: (context, snapshot) {
                final isLoading = snapshot.connectionState != ConnectionState.done;
                if (!_flutterDevVideoPlayerController.value.isPlaying) {
                  _flutterDevVideoPlayerController.play();
                }

                return SkeletonAnimationConfiguration.staggeredList(
                  position: 0,
                  isLoading: isLoading,
                  child: SkeletonLoader(
                    child: _IllustrationCard(
                      aspectRatio: 1632 / 1080,
                      logomark: const FlutterLogo(size: 48),
                      sourceLink: 'https://flutter.dev',
                      iconsColor: Colors.black54,
                      child: isLoading ? const SizedBox() : VideoPlayer(_flutterDevVideoPlayerController),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 40),
        ResponsiveFlex(
          children: [
            const _DescriptionCard(
              title: 'Dart Programming Language',
              body:
                  'Strong command of the Dart programming language, including its syntax, data types, functions, and object-oriented concepts.',
            ),
            _IllustrationCard(
              aspectRatio: 815 / 644,
              logomark: SvgPicture.asset(Assets.images.thirdParty.logoDart, height: 48, width: 48),
              sourceLink: 'https://dart.dev',
              iconsColor: Colors.white70,
              child: SvgPicture.asset(Assets.images.illustrations.dartAotCompile),
            ),
          ],
        ),
        const SizedBox(height: 40),
        ResponsiveFlex(
          children: [
            const _DescriptionCard(
              title: 'Version Control/Git',
              body:
                  'Proficient in using version control systems like Git for collaborative development and code management. My favorite clinet app for Git is <link href="https://www.gitkraken.com/">GitKraken</link>.',
            ),
            _IllustrationCard(
              aspectRatio: 337.718 / 262.979,
              logomark: SvgPicture.asset(Assets.images.thirdParty.gitLogomark, height: 48, width: 48),
              sourceLink: 'https://pixabay.com/vectors/code-software-development-git-7522129/',
              iconsColor: Colors.white70,
              child: SvgPicture.asset(Assets.images.illustrations.versionControl),
            ),
          ],
        ),
        const SizedBox(height: 40),
        ResponsiveFlex(
          children: [
            const _DescriptionCard(
              title: 'Continuous Integration/Delivery (CI/CD)',
              body:
                  'Knowledge of setting up and using CI/CD pipelines for automated builds, testing, and deployment using tools like Circle CI or GitHub Actions.',
            ),
            _IllustrationCard(
              aspectRatio: 12 / 9,
              logomark: SvgPicture.asset(Assets.images.thirdParty.githubActionsLogomark, height: 48, width: 48),
              sourceLink: 'https://github.com/features/actions',
              iconsColor: Colors.black54,
              background: const _GitHubActionsIllustrationBackground(),
              child: FractionalTranslation(
                translation: const Offset(0.25, -0.01),
                child: Transform(
                  transform: Matrix4.skew(-32 * (math.pi / 180), 0),
                  child: Transform.rotate(
                    angle: 15 * (math.pi / 180),
                    child: Image.asset(
                      Assets.images.illustrations.cicd.path,
                      width: 1280,
                      height: 1500,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        ResponsiveFlex(
          children: [
            const _DescriptionCard(
              title: 'Firebase',
              body:
                  'Familiarity with Firebase services, including Firestore, Authentication, Analytics, Dynamic Links, and Cloud Messaging (FCM) for real-time data and push notifications.',
            ),
            FutureBuilder(
              future: _firebaseHeroVideoPlayerInitializationFuture,
              builder: (context, snapshot) {
                final isLoading = snapshot.connectionState != ConnectionState.done;
                if (!_firebaseHeroVideoPlayerController.value.isPlaying) {
                  _firebaseHeroVideoPlayerController.play();
                }

                return SkeletonAnimationConfiguration.staggeredList(
                  position: 0,
                  isLoading: isLoading,
                  child: SkeletonLoader(
                    child: _IllustrationCard(
                      aspectRatio: 600 / 422.5,
                      sourceLink: 'https://firebase.google.com/',
                      iconsColor: Colors.white70,
                      logomark: SizedBox.square(
                        dimension: 48,
                        child: SvgPicture.asset(
                          Assets.images.thirdParty.firebaseLogomark,
                          alignment: Alignment.center,
                        ),
                      ),
                      child: isLoading
                          ? const SizedBox()
                          : Container(
                              color: const Color(0xFF1c72e8),
                              child: VideoPlayer(_firebaseHeroVideoPlayerController),
                            ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 40),
        ResponsiveFlex(
          children: [
            const _DescriptionCard(
              title: 'Material Design',
              body:
                  'Proficiency in implementing user interfaces following the principles of Material Design, utilizing its clean and intuitive design language to create visually appealing and user-friendly mobile applications.',
            ),
            _IllustrationCard(
              aspectRatio: 1400 / 915,
              logomark: SvgPicture.asset(Assets.images.thirdParty.googleMaterialDesignLogo, height: 48, width: 48),
              sourceLink: 'https://material.io/blog/material-3-figma-design-kit',
              iconsColor: Colors.black54,
              addOutline: true,
              child: Image.asset(Assets.images.illustrations.materialDesign.path),
            ),
          ],
        ),
        const SizedBox(height: 40),
        ResponsiveFlex(
          children: [
            const _DescriptionCard(
              title: 'Responsive Design',
              body:
                  'Expertise in creating responsive UI layouts that adapt to different screen sizes and orientations.',
            ),
            FutureBuilder(
              future: _responsiveLayoutVideoPlayerInitializationFuture,
              builder: (context, snapshot) {
                final isLoading = snapshot.connectionState != ConnectionState.done;
                if (!_responsiveLayoutVideoPlayerController.value.isPlaying) {
                  _responsiveLayoutVideoPlayerController.play();
                }

                return SkeletonAnimationConfiguration.staggeredList(
                  position: 0,
                  isLoading: isLoading,
                  child: SkeletonLoader(
                    child: _IllustrationCard(
                      aspectRatio: 2048 / 1378,
                      sourceLink: 'https://m3.material.io/components/navigation-bar/guidelines',
                      iconsColor: Colors.black54,
                      addOutline: true,
                      child: isLoading ? const SizedBox() : VideoPlayer(_responsiveLayoutVideoPlayerController),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 40),
        ResponsiveFlex(
          children: [
            const _DescriptionCard(
              title: 'Design Systems',
              body:
                  'Experience in creating, maintaining, and testing design systems, ensuring consistent visual elements, typography, and UI components across multiple projects for enhanced brand identity and streamlined development.',
            ),
            _IllustrationCard(
              aspectRatio: 1534 / 911,
              sourceLink: 'https://dribbble.com/shots/17451985-Design-system-in-Figma',
              iconsColor: Colors.black54,
              addOutline: true,
              child: Image.asset(Assets.images.illustrations.designSystem.path),
            ),
          ],
        ),
        const SizedBox(height: 40),
        ResponsiveFlex(
          children: [
            const _DescriptionCard(
              title: 'Internationalization (i18n)',
              body:
                  'Experience with implementing internationalization and localization in Flutter apps using the intl package.',
            ),
            _IllustrationCard(
              aspectRatio: 1534 / 911,
              sourceLink: 'https://localizely.com/',
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(Assets.images.illustrations.i18n),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        const _DescriptionCard(
          title: 'Automated Testing',
          body:
              'Experience with unit testing using Flutter\'s built-in testing framework or packages like flutter_test.',
        ),
        const SizedBox(height: 40),
        ResponsiveFlex(
          flexes: const [2, 1],
          children: [
            const _DescriptionCard(
              title: 'Effects and Animations',
              body:
                  'Skill in crafting engaging user experiences through dynamic effects and animations, enhancing app interactivity and user delight by seamlessly integrating motion design principles into the user interface.',
            ),
            _IllustrationCard(
              aspectRatio: 1,
              child: rive.RiveAnimation.asset(
                Assets.animations.utopicNarwhal,
                fit: BoxFit.fitWidth,
                stateMachines: const ['State Machine 1'],
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        const _DescriptionCard(
          title: 'Performance Optimization',
          body:
              'Understanding of performance optimization techniques, such as reducing app size, optimizing animations, and efficient widget rendering.',
        ),
        const SizedBox(height: 40),
        ResponsiveFlex(
          flexes: const [2, 1],
          children: [
            const _DescriptionCard(
              title: 'App Deployment',
              body:
                  'Experience with deploying Flutter apps to the Google Play Store and Apple App Store, including code signing and release management.',
            ),
            _IllustrationCard(
              aspectRatio: 503 / 440,
              iconsColor: Colors.black54,
              addOutline: true,
              child: Image.asset(Assets.images.illustrations.appDeployment.path),
            ),
          ],
        ),
      ],
    );
  }
}

class _DescriptionCard extends StatelessWidget {
  const _DescriptionCard({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final double edgePadding = context.isSmallScreen ? 20 : 40;

    return CardPlus(
      padding: EdgeInsets.all(edgePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectableText(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          StyledText.selectable(
            text: body,
            style: Theme.of(context).textTheme.bodyLarge,
            tags: getUnifiedStyledTextTags(context),
          ),
        ],
      ),
    );
  }
}

class _IllustrationCard extends StatelessWidget {
  const _IllustrationCard({
    required this.aspectRatio,
    required this.child,
    this.background,
    this.logomark,
    this.sourceLink,
    this.iconsColor,
    this.addOutline = false,
  });

  final Widget child;
  final double aspectRatio;
  final Widget? logomark;
  final Widget? background;
  final String? sourceLink;
  final Color? iconsColor;
  final bool addOutline;

  @override
  Widget build(BuildContext context) {
    return CardPlus(
      addOutline: addOutline,
      child: Stack(
        children: [
          if (background != null) Positioned.fill(child: background!),
          AspectRatio(
            aspectRatio: aspectRatio,
            child: child,
          ),
          if (logomark != null)
            Positioned(
              top: 10,
              left: 10,
              child: logomark!,
            ),
          if (sourceLink != null)
            Positioned(
              bottom: 0,
              right: 0,
              child: CustomIconButton(
                onPressed: () {
                  url_launcher.launchUrl(Uri.parse(sourceLink!));
                },
                tooltip: Dictums.of(context).sourceTooltip,
                icon: Icon(
                  Icons.art_track_rounded,
                  color: iconsColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _GitHubActionsIllustrationBackground extends StatelessWidget {
  const _GitHubActionsIllustrationBackground();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.white),
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(-0.6, 0),
              radius: 0.8,
              colors: [const Color(0x596299FF), Colors.white.withOpacity(0)],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0, 0),
              radius: 0.8,
              colors: [const Color(0x70FFA8A8), Colors.white.withOpacity(0)],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0.6, 0),
              radius: 0.8,
              colors: [const Color(0x70FFF280), Colors.white.withOpacity(0)],
            ),
          ),
        ),
      ],
    );
  }
}
