import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/flutter_gen/assets.gen.dart';
import 'package:portfolio/l10n/generated/l10n.dart';
import 'package:portfolio/src/common_widgets/compositions/illustration_card.dart';
import 'package:portfolio/src/common_widgets/compositions/text_passage_card.dart';
import 'package:portfolio/src/common_widgets/mouse_detector.dart';
import 'package:portfolio/src/design_system/layout/custom_primary_view.dart';
import 'package:portfolio/src/design_system/layout/responsive_flex.dart';
import 'package:portfolio/src/design_system/styles/motion/transitions.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';
import 'package:rive/rive.dart' as rive;
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
            TextPassageCard(
              title: Dictums.of(context).flutterFrameworkTitle,
              body: Dictums.of(context).flutterFrameworkHardSkillBody,
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
                    child: IllustrationCard(
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
            TextPassageCard(
              title: Dictums.of(context).dartProgrammingLanguageHardSkillTitle,
              body: Dictums.of(context).dartProgrammingLanguageHardSkillBody,
            ),
            IllustrationCard(
              aspectRatio: 815 / 644,
              logomark: SvgPicture.asset(Assets.images.thirdParty.logoDart, height: 48, width: 48),
              sourceLink: 'https://dart.dev',
              iconsColor: Colors.white70,
              child: SvgPicture.asset(
                Assets.images.illustrations.hardSkills.dartAotCompile,
                placeholderBuilder: (context) => SkeletonAnimationConfiguration.staggeredList(
                  position: 1,
                  isLoading: true,
                  child: SkeletonLoader(child: Container()),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        ResponsiveFlex(
          children: [
            TextPassageCard(
              title: Dictums.of(context).versionControlHardSkillTitle,
              body: Dictums.of(context).versionControlHardSkillBody,
            ),
            IllustrationCard(
              aspectRatio: 337.718 / 262.979,
              logomark: SvgPicture.asset(Assets.images.thirdParty.gitLogomark, height: 48, width: 48),
              sourceLink: 'https://pixabay.com/vectors/code-software-development-git-7522129/',
              iconsColor: Colors.white70,
              child: SvgPicture.asset(
                Assets.images.illustrations.hardSkills.versionControl,
                placeholderBuilder: (context) => SkeletonAnimationConfiguration.staggeredList(
                  position: 2,
                  isLoading: true,
                  child: SkeletonLoader(child: Container()),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        ResponsiveFlex(
          children: [
            TextPassageCard(
              title: Dictums.of(context).cicdHardSkillTitle,
              body: Dictums.of(context).cicdHardSkillBody,
            ),
            IllustrationCard(
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
                      Assets.images.illustrations.hardSkills.cicd.path,
                      width: 1280,
                      height: 1500,
                      fit: BoxFit.contain,
                      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => frame != null
                          ? child
                          : SkeletonAnimationConfiguration.staggeredList(
                              position: 3,
                              isLoading: true,
                              child: SkeletonLoader(child: Container()),
                            ),
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
            TextPassageCard(
              title: Dictums.of(context).firebaseToolsHardSkillTitle,
              body: Dictums.of(context).firebaseToolsHardSkillBody,
            ),
            FutureBuilder(
              future: _firebaseHeroVideoPlayerInitializationFuture,
              builder: (context, snapshot) {
                final isLoading = snapshot.connectionState != ConnectionState.done;
                if (!_firebaseHeroVideoPlayerController.value.isPlaying) {
                  _firebaseHeroVideoPlayerController.play();
                }

                return SkeletonAnimationConfiguration.staggeredList(
                  position: 4,
                  isLoading: isLoading,
                  child: SkeletonLoader(
                    child: IllustrationCard(
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
            TextPassageCard(
              title: Dictums.of(context).googleMaterialDesignHardSkillTitle,
              body: Dictums.of(context).googleMaterialDesignHardSkillBody,
            ),
            IllustrationCard(
              aspectRatio: 1400 / 915,
              logomark: SvgPicture.asset(Assets.images.thirdParty.googleMaterialDesignLogo, height: 48, width: 48),
              sourceLink: 'https://material.io/blog/material-3-figma-design-kit',
              iconsColor: Colors.black54,
              addOutline: true,
              child: Image.asset(
                Assets.images.illustrations.hardSkills.materialDesign.path,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => frame != null
                    ? child
                    : SkeletonAnimationConfiguration.staggeredList(
                        position: 5,
                        isLoading: true,
                        child: SkeletonLoader(child: Container()),
                      ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        ResponsiveFlex(
          children: [
            TextPassageCard(
              title: Dictums.of(context).responsiveDesignHardSkillTitle,
              body: Dictums.of(context).responsiveDesignHardSkillBody,
            ),
            FutureBuilder(
              future: _responsiveLayoutVideoPlayerInitializationFuture,
              builder: (context, snapshot) {
                final isLoading = snapshot.connectionState != ConnectionState.done;
                if (!_responsiveLayoutVideoPlayerController.value.isPlaying) {
                  _responsiveLayoutVideoPlayerController.play();
                }

                return SkeletonAnimationConfiguration.staggeredList(
                  position: 6,
                  isLoading: isLoading,
                  child: SkeletonLoader(
                    child: IllustrationCard(
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
            TextPassageCard(
              title: Dictums.of(context).designSystemsHardSkillTitle,
              body: Dictums.of(context).designSystemsHardSkillBody,
            ),
            IllustrationCard(
              aspectRatio: 1534 / 911,
              sourceLink: 'https://dribbble.com/shots/17451985-Design-system-in-Figma',
              iconsColor: Colors.black54,
              addOutline: true,
              child: Image.asset(
                Assets.images.illustrations.hardSkills.designSystem.path,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => frame != null
                    ? child
                    : SkeletonAnimationConfiguration.staggeredList(
                        position: 7,
                        isLoading: true,
                        child: SkeletonLoader(child: Container()),
                      ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        ResponsiveFlex(
          children: [
            TextPassageCard(
              title: Dictums.of(context).internationalizationHardSkillTitle,
              body: Dictums.of(context).internationalizationHardSkillBody,
            ),
            IllustrationCard(
              aspectRatio: 1534 / 911,
              sourceLink: 'https://localizely.com/',
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  Assets.images.illustrations.hardSkills.i18n,
                  placeholderBuilder: (context) => SkeletonAnimationConfiguration.staggeredList(
                    position: 8,
                    isLoading: true,
                    child: SkeletonLoader(child: Container()),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        ResponsiveFlex(
          flexes: const [2, 1],
          children: [
            TextPassageCard(
              title: Dictums.of(context).effectsAndAnimationsHardSkillTitle,
              body: Dictums.of(context).effectsAndAnimationsHardSkillBody,
            ),
            MouseDetector(
              builder: (context, isMouseDetected, child) {
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: isMouseDetected
                      ? null
                      : () {
                          Navigator.of(context).push(
                            DialogRoute(
                              context: context,
                              barrierColor: Theme.of(context).colorScheme.scrim,
                              builder: (context) {
                                return Dialog(
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                  child: IgnorePointer(
                    ignoring: !isMouseDetected,
                    child: child,
                  ),
                );
              },
              child: Hero(
                tag: Assets.animations.utopicNarwhal,
                child: IllustrationCard(
                  aspectRatio: 1,
                  child: rive.RiveAnimation.asset(
                    Assets.animations.utopicNarwhal,
                    fit: BoxFit.fitWidth,
                    stateMachines: const ['State Machine 1'],
                    placeHolder: SkeletonAnimationConfiguration.staggeredList(
                      position: 9,
                      isLoading: true,
                      child: SkeletonLoader(child: Container()),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        ResponsiveFlex(
          flexes: const [2, 1],
          children: [
            TextPassageCard(
              title: Dictums.of(context).appDeploymentHardSkillTitle,
              body: Dictums.of(context).appDeploymentHardSkillBody,
            ),
            IllustrationCard(
              aspectRatio: 503 / 440,
              iconsColor: Colors.black54,
              addOutline: true,
              child: Image.asset(
                Assets.images.illustrations.hardSkills.appDeployment.path,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => frame != null
                    ? child
                    : SkeletonAnimationConfiguration.staggeredList(
                        position: 10,
                        isLoading: true,
                        child: SkeletonLoader(child: Container()),
                      ),
              ),
            ),
          ],
        ),
      ],
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
