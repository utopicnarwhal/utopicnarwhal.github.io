import 'package:flutter/material.dart';
import 'package:portfolio/src/global_widgets/card_plus.dart';
import 'package:portfolio/src/global_widgets/effects.dart';
import 'package:portfolio/src/global_widgets/layout/custom_primary_view.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';
import 'package:video_player/video_player.dart';

class HardSkillsView extends StatefulWidget {
  const HardSkillsView({super.key});

  @override
  State<HardSkillsView> createState() => _HardSkillsViewState();
}

class _HardSkillsViewState extends State<HardSkillsView> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _videoPlayerInitializationFuture;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse('https://storage.googleapis.com/cms-storage-bucket/029113ae2cbbcf9493fe.mp4'),
    );
    _videoPlayerInitializationFuture = _videoPlayerController.initialize().then((_) async {
      await _videoPlayerController.setLooping(true);
      // Attempts to start playing videos with an audio track (or not muted) without user interaction with the site ("user activation") will be prohibited by the browser and cause runtime errors in JS.
      await _videoPlayerController.setVolume(0).then((_) => _videoPlayerController.play());
    });
  }

  @override
  void dispose() {
    _videoPlayerInitializationFuture.ignore();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double edgePadding = context.isSmallScreen ? 20 : 40;

    return CustomPrimaryView(
      edgePadding: edgePadding,
      children: [
        SelectableText(
          'Hard skills',
          style: Theme.of(context).textTheme.displayMedium,
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
                      'Flutter Framework',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 10),
                    SelectableText(
                      'Proficiency in building mobile applications using the Flutter framework, including knowledge of widgets, animations, and UI components.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox.square(dimension: 20),
            Flexible(
              child: FutureBuilder(
                future: _videoPlayerInitializationFuture,
                builder: (context, snapshot) {
                  final isLoading = snapshot.connectionState != ConnectionState.done;

                  return CardPlus(
                    child: SkeletonAnimationConfiguration.staggeredList(
                      position: 0,
                      isLoading: isLoading,
                      child: SkeletonLoader(
                        child: AspectRatio(
                          aspectRatio: 1632 / 1080,
                          child: isLoading ? const SizedBox() : VideoPlayer(_videoPlayerController),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 100),
        CardPlus(
          padding: EdgeInsets.all(edgePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SelectableText(
                'Dart Programming: Strong command of the Dart programming language, including its syntax, data types, functions, and object-oriented concepts.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SelectableText(
                'Version Control/Git: Proficient in using version control systems like Git for collaborative development and code management.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SelectableText(
                'Continuous Integration (CI/CD): Knowledge of setting up and using CI/CD pipelines for automated builds, testing, and deployment using tools like Circle CI or GitHub Actions.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SelectableText(
                'Firebase: Familiarity with Firebase services, including Firestore, Authentication, Analytics, Dynamic Links, and Cloud Messaging (FCM) for real-time data and push notifications.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SelectableText(
                'Material Design: Proficiency in implementing user interfaces following the principles of Material Design, utilizing its clean and intuitive design language to create visually appealing and user-friendly mobile applications.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SelectableText(
                'Responsive Design: Expertise in creating responsive UI layouts that adapt to different screen sizes and orientations.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SelectableText(
                'Design Systems: Experience in creating, maintaining, and testing design systems, ensuring consistent visual elements, typography, and UI components across multiple projects for enhanced brand identity and streamlined development.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SelectableText(
                'Internationalization (i18n): Experience with implementing internationalization and localization in Flutter apps using the intl package.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SelectableText(
                'Automated Testing: Experience with unit testing using Flutter\'s built-in testing framework or packages like flutter_test.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SelectableText(
                'Performance Optimization: Understanding of performance optimization techniques, such as reducing app size, optimizing animations, and efficient widget rendering.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SelectableText(
                'Effects and Animations: Skill in crafting engaging user experiences through dynamic effects and animations, enhancing app interactivity and user delight by seamlessly integrating motion design principles into the user interface.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SelectableText(
                'App Deployment: Experience with deploying Flutter apps to the Google Play Store and Apple App Store, including code signing and release management.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
