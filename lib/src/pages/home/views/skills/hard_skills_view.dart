import 'package:flutter/material.dart';
import 'package:portfolio/src/global_widgets/card_plus.dart';
import 'package:portfolio/src/global_widgets/layout/custom_primary_view.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';

class HardSkillsView extends StatefulWidget {
  const HardSkillsView({super.key});

  @override
  State<HardSkillsView> createState() => _HardSkillsViewState();
}

class _HardSkillsViewState extends State<HardSkillsView> {
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
        CardPlus(
          padding: EdgeInsets.all(edgePadding),
          child: SelectableText(
            '''Flutter Framework: Proficiency in building mobile applications using the Flutter framework, including knowledge of widgets, animations, and UI components.

Dart Programming: Strong command of the Dart programming language, including its syntax, data types, functions, and object-oriented concepts.

Version Control/Git: Proficient in using version control systems like Git for collaborative development and code management.

Continuous Integration (CI/CD): Knowledge of setting up and using CI/CD pipelines for automated builds, testing, and deployment using tools like Circle CI or GitHub Actions.

Firebase: Familiarity with Firebase services, including Firestore, Authentication, Analytics, Dynamic Links, and Cloud Messaging (FCM) for real-time data and push notifications.

Material Design: Proficiency in implementing user interfaces following the principles of Material Design, utilizing its clean and intuitive design language to create visually appealing and user-friendly mobile applications.

Responsive Design: Expertise in creating responsive UI layouts that adapt to different screen sizes and orientations.

Design Systems: Experience in creating, maintaining, and testing design systems, ensuring consistent visual elements, typography, and UI components across multiple projects for enhanced brand identity and streamlined development.

Internationalization (i18n): Experience with implementing internationalization and localization in Flutter apps using the intl package.

Automated Testing: Experience with unit testing using Flutter's built-in testing framework or packages like flutter_test.

Performance Optimization: Understanding of performance optimization techniques, such as reducing app size, optimizing animations, and efficient widget rendering.

Effects and Animations: Skill in crafting engaging user experiences through dynamic effects and animations, enhancing app interactivity and user delight by seamlessly integrating motion design principles into the user interface.

App Deployment: Experience with deploying Flutter apps to the Google Play Store and Apple App Store, including code signing and release management.''',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
