// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Dictums {
  Dictums();

  static Dictums? _current;

  static Dictums get current {
    assert(_current != null,
        'No instance of Dictums was loaded. Try to initialize the Dictums delegate before accessing Dictums.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Dictums> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Dictums();
      Dictums._current = instance;

      return instance;
    });
  }

  static Dictums of(BuildContext context) {
    final instance = Dictums.maybeOf(context);
    assert(instance != null,
        'No instance of Dictums present in the widget tree. Did you add Dictums.delegate in localizationsDelegates?');
    return instance!;
  }

  static Dictums? maybeOf(BuildContext context) {
    return Localizations.of<Dictums>(context, Dictums);
  }

  /// `Contact me!`
  String get contactMeButton {
    return Intl.message(
      'Contact me!',
      name: 'contactMeButton',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get changeLanguageButtonTooltip {
    return Intl.message(
      'Change language',
      name: 'changeLanguageButtonTooltip',
      desc: '',
      args: [],
    );
  }

  /// `"{text}" copied to your clipboard`
  String copyToClipboardMessage(String text) {
    return Intl.message(
      '"$text" copied to your clipboard',
      name: 'copyToClipboardMessage',
      desc: '',
      args: [text],
    );
  }

  /// `Hello!\nI’m Sergei.`
  String get introViewGreeting {
    return Intl.message(
      'Hello!\nI’m Sergei.',
      name: 'introViewGreeting',
      desc: '',
      args: [],
    );
  }

  /// `Portfolio`
  String get homePageAppBarTitle {
    return Intl.message(
      'Portfolio',
      name: 'homePageAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `professional <link href="https://flutter.dev/">flutter</link> developer based in Helsinki, Finland`
  String get introViewMyTitleString {
    return Intl.message(
      'professional <link href="https://flutter.dev/">flutter</link> developer based in Helsinki, Finland',
      name: 'introViewMyTitleString',
      desc: '',
      args: [],
    );
  }

  /// `Toggle theme mode`
  String get toggleThemeModeButtonTooltip {
    return Intl.message(
      'Toggle theme mode',
      name: 'toggleThemeModeButtonTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Professional Summary`
  String get professionalSummaryTitle {
    return Intl.message(
      'Professional Summary',
      name: 'professionalSummaryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Skilful mobile developer with 6+ years of dedicated expertise in crafting Android, iOS, and Web apps using Flutter and publishing them into the app stores. Committed to creating top-notch applications by prioritizing clean, readable code and exceptional user experiences.`
  String get professionalSummaryCardBodyText {
    return Intl.message(
      'Skilful mobile developer with 6+ years of dedicated expertise in crafting Android, iOS, and Web apps using Flutter and publishing them into the app stores. Committed to creating top-notch applications by prioritizing clean, readable code and exceptional user experiences.',
      name: 'professionalSummaryCardBodyText',
      desc: '',
      args: [],
    );
  }

  /// `Open CV`
  String get openCvButton {
    return Intl.message(
      'Open CV',
      name: 'openCvButton',
      desc: '',
      args: [],
    );
  }

  /// `Learn more`
  String get learnMoreButton {
    return Intl.message(
      'Learn more',
      name: 'learnMoreButton',
      desc: '',
      args: [],
    );
  }

  /// `Key skills`
  String get keySkillsHeadline {
    return Intl.message(
      'Key skills',
      name: 'keySkillsHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Hard skills`
  String get hardSkillsTitle {
    return Intl.message(
      'Hard skills',
      name: 'hardSkillsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Soft skills`
  String get softSkillsTitle {
    return Intl.message(
      'Soft skills',
      name: 'softSkillsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Problem-Solving`
  String get softSkillProblemSolving {
    return Intl.message(
      'Problem-Solving',
      name: 'softSkillProblemSolving',
      desc: '',
      args: [],
    );
  }

  /// `Adaptability`
  String get softSkillAdaptability {
    return Intl.message(
      'Adaptability',
      name: 'softSkillAdaptability',
      desc: '',
      args: [],
    );
  }

  /// `Communication`
  String get softSkillCommunication {
    return Intl.message(
      'Communication',
      name: 'softSkillCommunication',
      desc: '',
      args: [],
    );
  }

  /// `Teamwork`
  String get softSkillTeamwork {
    return Intl.message(
      'Teamwork',
      name: 'softSkillTeamwork',
      desc: '',
      args: [],
    );
  }

  /// `Time Management`
  String get softSkillTimeManagement {
    return Intl.message(
      'Time Management',
      name: 'softSkillTimeManagement',
      desc: '',
      args: [],
    );
  }

  /// `Creativity`
  String get softSkillCreativity {
    return Intl.message(
      'Creativity',
      name: 'softSkillCreativity',
      desc: '',
      args: [],
    );
  }

  /// `Attention to Detail`
  String get softSkillAttentionToDetail {
    return Intl.message(
      'Attention to Detail',
      name: 'softSkillAttentionToDetail',
      desc: '',
      args: [],
    );
  }

  /// `Initiative`
  String get softSkillInitiative {
    return Intl.message(
      'Initiative',
      name: 'softSkillInitiative',
      desc: '',
      args: [],
    );
  }

  /// `Open-Mindedness`
  String get softSkillOpenMindedness {
    return Intl.message(
      'Open-Mindedness',
      name: 'softSkillOpenMindedness',
      desc: '',
      args: [],
    );
  }

  /// `Source`
  String get sourceTooltip {
    return Intl.message(
      'Source',
      name: 'sourceTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Projects Showcase`
  String get projectsShowcaseHeadline {
    return Intl.message(
      'Projects Showcase',
      name: 'projectsShowcaseHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Framework`
  String get flutterFrameworkTitle {
    return Intl.message(
      'Flutter Framework',
      name: 'flutterFrameworkTitle',
      desc: '',
      args: [],
    );
  }

  /// `Proficiency in building mobile applications using the Flutter framework, including knowledge of architecture, theming, routing, animations, advanced scrolling, UI components, etc. By the way, this web app is also built with Flutter.`
  String get flutterFrameworkHardSkillBody {
    return Intl.message(
      'Proficiency in building mobile applications using the Flutter framework, including knowledge of architecture, theming, routing, animations, advanced scrolling, UI components, etc. By the way, this web app is also built with Flutter.',
      name: 'flutterFrameworkHardSkillBody',
      desc: '',
      args: [],
    );
  }

  /// `Dart Programming Language`
  String get dartProgrammingLanguageHardSkillTitle {
    return Intl.message(
      'Dart Programming Language',
      name: 'dartProgrammingLanguageHardSkillTitle',
      desc: '',
      args: [],
    );
  }

  /// `Proficient with a strong command of the Dart programming language, showcasing expertise in syntax, data manipulation, object-oriented principles, functions, and efficient utilization of language features. Experienced in designing and implementing robust, performant software solutions, including frontend and backend logic as well as utility scripts, harnessing Dart's versatile capabilities.`
  String get dartProgrammingLanguageHardSkillBody {
    return Intl.message(
      'Proficient with a strong command of the Dart programming language, showcasing expertise in syntax, data manipulation, object-oriented principles, functions, and efficient utilization of language features. Experienced in designing and implementing robust, performant software solutions, including frontend and backend logic as well as utility scripts, harnessing Dart\'s versatile capabilities.',
      name: 'dartProgrammingLanguageHardSkillBody',
      desc: '',
      args: [],
    );
  }

  /// `Version Control`
  String get versionControlHardSkillTitle {
    return Intl.message(
      'Version Control',
      name: 'versionControlHardSkillTitle',
      desc: '',
      args: [],
    );
  }

  /// `Knowledgeable in using version control systems like Git for collaborative development and code management. I also find great value in the user-friendly <link href="https://www.gitkraken.com/">GitKraken</link> client app for its smooth interface and powerful features.`
  String get versionControlHardSkillBody {
    return Intl.message(
      'Knowledgeable in using version control systems like Git for collaborative development and code management. I also find great value in the user-friendly <link href="https://www.gitkraken.com/">GitKraken</link> client app for its smooth interface and powerful features.',
      name: 'versionControlHardSkillBody',
      desc: '',
      args: [],
    );
  }

  /// `Continuous Integration and Continuous Delivery`
  String get cicdHardSkillTitle {
    return Intl.message(
      'Continuous Integration and Continuous Delivery',
      name: 'cicdHardSkillTitle',
      desc: '',
      args: [],
    );
  }

  /// `Familiar with the process of establishing and effectively employing CI/CD pipelines to automate key aspects of software development, including building, testing, and deploying applications. I have hands-on experience utilizing popular tools like <link href="https://circleci.com/">Circle CI</link> and <link href="https://github.com/features/actions">GitHub Actions</link> to streamline development workflows, enhance code quality through automated testing, and ensure swift and reliable deployment of software updates.`
  String get cicdHardSkillBody {
    return Intl.message(
      'Familiar with the process of establishing and effectively employing CI/CD pipelines to automate key aspects of software development, including building, testing, and deploying applications. I have hands-on experience utilizing popular tools like <link href="https://circleci.com/">Circle CI</link> and <link href="https://github.com/features/actions">GitHub Actions</link> to streamline development workflows, enhance code quality through automated testing, and ensure swift and reliable deployment of software updates.',
      name: 'cicdHardSkillBody',
      desc: '',
      args: [],
    );
  }

  /// `Firebase Tools`
  String get firebaseToolsHardSkillTitle {
    return Intl.message(
      'Firebase Tools',
      name: 'firebaseToolsHardSkillTitle',
      desc: '',
      args: [],
    );
  }

  /// `I'm comfortable with a range of Firebase services that improve apps. This includes Firebase App Distribution, which makes sharing test versions simple, and Firebase Remote Config, allowing apps to change without updates. I'm also familiar with Analytics for insights and Cloud Messaging (FCM) for push notifications, helping me create apps with real-time updates and enhanced user engagement.`
  String get firebaseToolsHardSkillBody {
    return Intl.message(
      'I\'m comfortable with a range of Firebase services that improve apps. This includes Firebase App Distribution, which makes sharing test versions simple, and Firebase Remote Config, allowing apps to change without updates. I\'m also familiar with Analytics for insights and Cloud Messaging (FCM) for push notifications, helping me create apps with real-time updates and enhanced user engagement.',
      name: 'firebaseToolsHardSkillBody',
      desc: '',
      args: [],
    );
  }

  /// `Google Material Design`
  String get googleMaterialDesignHardSkillTitle {
    return Intl.message(
      'Google Material Design',
      name: 'googleMaterialDesignHardSkillTitle',
      desc: '',
      args: [],
    );
  }

  /// `Skilled in adeptly crafting user interfaces that adhere to the foundational principles of Material Design. Leveraging its elegant and intuitive design language, I consistently deliver visually captivating and user-centric applications. My deep understanding of Material Design guidelines and best practices ensures the creation of cohesive and delightful user experiences. By thoughtfully integrating typography, color, and motion, I contribute to the development of applications that resonate with modern design sensibilities while maintaining user-friendliness.`
  String get googleMaterialDesignHardSkillBody {
    return Intl.message(
      'Skilled in adeptly crafting user interfaces that adhere to the foundational principles of Material Design. Leveraging its elegant and intuitive design language, I consistently deliver visually captivating and user-centric applications. My deep understanding of Material Design guidelines and best practices ensures the creation of cohesive and delightful user experiences. By thoughtfully integrating typography, color, and motion, I contribute to the development of applications that resonate with modern design sensibilities while maintaining user-friendliness.',
      name: 'googleMaterialDesignHardSkillBody',
      desc: '',
      args: [],
    );
  }

  /// `Responsive Design`
  String get responsiveDesignHardSkillTitle {
    return Intl.message(
      'Responsive Design',
      name: 'responsiveDesignHardSkillTitle',
      desc: '',
      args: [],
    );
  }

  /// `Proficient in the art of designing responsive UI layouts that seamlessly adjust to diverse screen dimensions and orientations. With a keen eye for detail and a deep understanding of design principles, I consistently develop interfaces that maintain visual coherence and functionality across various devices. This expertise also involves taking into consideration possible inputs like mouse or touch interactions, ensuring a smooth and intuitive user experience regardless of the device in use.`
  String get responsiveDesignHardSkillBody {
    return Intl.message(
      'Proficient in the art of designing responsive UI layouts that seamlessly adjust to diverse screen dimensions and orientations. With a keen eye for detail and a deep understanding of design principles, I consistently develop interfaces that maintain visual coherence and functionality across various devices. This expertise also involves taking into consideration possible inputs like mouse or touch interactions, ensuring a smooth and intuitive user experience regardless of the device in use.',
      name: 'responsiveDesignHardSkillBody',
      desc: '',
      args: [],
    );
  }

  /// `Design Systems`
  String get designSystemsHardSkillTitle {
    return Intl.message(
      'Design Systems',
      name: 'designSystemsHardSkillTitle',
      desc: '',
      args: [],
    );
  }

  /// `Experience in creating, maintaining, and testing design systems, ensuring consistent visual elements, typography, and UI components across multiple projects for enhanced brand identity and streamlined development.`
  String get designSystemsHardSkillBody {
    return Intl.message(
      'Experience in creating, maintaining, and testing design systems, ensuring consistent visual elements, typography, and UI components across multiple projects for enhanced brand identity and streamlined development.',
      name: 'designSystemsHardSkillBody',
      desc: '',
      args: [],
    );
  }

  /// `Internationalization`
  String get internationalizationHardSkillTitle {
    return Intl.message(
      'Internationalization',
      name: 'internationalizationHardSkillTitle',
      desc: '',
      args: [],
    );
  }

  /// `Experienced in integrating language options and localized content using the 'intl' package for Flutter apps. Used POEditor to manage translations efficiently. Skilled in utilizing '.arb' files to automatically update app interfaces and content in various languages, ensuring enhanced user-friendliness for a diverse audience.`
  String get internationalizationHardSkillBody {
    return Intl.message(
      'Experienced in integrating language options and localized content using the \'intl\' package for Flutter apps. Used POEditor to manage translations efficiently. Skilled in utilizing \'.arb\' files to automatically update app interfaces and content in various languages, ensuring enhanced user-friendliness for a diverse audience.',
      name: 'internationalizationHardSkillBody',
      desc: '',
      args: [],
    );
  }

  /// `Effects and Animations`
  String get effectsAndAnimationsHardSkillTitle {
    return Intl.message(
      'Effects and Animations',
      name: 'effectsAndAnimationsHardSkillTitle',
      desc: '',
      args: [],
    );
  }

  /// `Have crafted captivating user experiences through the development and seamless integration of animations and transition effects within apps. Leveraging the versatile <link href="https://rive.app/">Rive</link> animation format, which supports the import of <link href="https://lottiefiles.com/">Lottie</link> animations and allows for interactive animations. Feel free to explore these interactions firsthand in the next card by simply clicking on it or hovering your mouse cursor over it.`
  String get effectsAndAnimationsHardSkillBody {
    return Intl.message(
      'Have crafted captivating user experiences through the development and seamless integration of animations and transition effects within apps. Leveraging the versatile <link href="https://rive.app/">Rive</link> animation format, which supports the import of <link href="https://lottiefiles.com/">Lottie</link> animations and allows for interactive animations. Feel free to explore these interactions firsthand in the next card by simply clicking on it or hovering your mouse cursor over it.',
      name: 'effectsAndAnimationsHardSkillBody',
      desc: '',
      args: [],
    );
  }

  /// `App Deployment`
  String get appDeploymentHardSkillTitle {
    return Intl.message(
      'App Deployment',
      name: 'appDeploymentHardSkillTitle',
      desc: '',
      args: [],
    );
  }

  /// `Experience with deploying Flutter apps to the Google Play Store and Apple App Store, including code signing and release management, and leveraging the <link href="https://fastlane.tools/">fastlane.tools</link> to streamline and automate the deployment process, ensuring seamless and consistent delivery of app updates to both platforms.`
  String get appDeploymentHardSkillBody {
    return Intl.message(
      'Experience with deploying Flutter apps to the Google Play Store and Apple App Store, including code signing and release management, and leveraging the <link href="https://fastlane.tools/">fastlane.tools</link> to streamline and automate the deployment process, ensuring seamless and consistent delivery of app updates to both platforms.',
      name: 'appDeploymentHardSkillBody',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailTitle {
    return Intl.message(
      'Email',
      name: 'emailTitle',
      desc: '',
      args: [],
    );
  }

  /// `I excel at analyzing complex issues and formulating innovative solutions through a methodical approach, combining critical thinking with a knack for thinking outside the box.`
  String get softSkillProblemSolvingBody {
    return Intl.message(
      'I excel at analyzing complex issues and formulating innovative solutions through a methodical approach, combining critical thinking with a knack for thinking outside the box.',
      name: 'softSkillProblemSolvingBody',
      desc: '',
      args: [],
    );
  }

  /// `I thrive in dynamic environments, swiftly adjusting my strategies to meet evolving challenges, and embracing change as an opportunity for growth and learning.`
  String get softSkillAdaptabilityBody {
    return Intl.message(
      'I thrive in dynamic environments, swiftly adjusting my strategies to meet evolving challenges, and embracing change as an opportunity for growth and learning.',
      name: 'softSkillAdaptabilityBody',
      desc: '',
      args: [],
    );
  }

  /// `With a strong ability to articulate ideas clearly and listen actively, I foster effective collaboration and ensure that all stakeholders are well-informed and engaged in the discourse.`
  String get softSkillCommunicationBody {
    return Intl.message(
      'With a strong ability to articulate ideas clearly and listen actively, I foster effective collaboration and ensure that all stakeholders are well-informed and engaged in the discourse.',
      name: 'softSkillCommunicationBody',
      desc: '',
      args: [],
    );
  }

  /// `Recognizing the strength of diverse perspectives, I actively contribute my skills while also valuing and integrating the contributions of others, thereby creating a harmonious and productive team environment.`
  String get softSkillTeamworkBody {
    return Intl.message(
      'Recognizing the strength of diverse perspectives, I actively contribute my skills while also valuing and integrating the contributions of others, thereby creating a harmonious and productive team environment.',
      name: 'softSkillTeamworkBody',
      desc: '',
      args: [],
    );
  }

  /// `I adeptly organize and prioritize tasks to meet deadlines without compromising quality, ensuring efficient workflows and consistently delivering results.`
  String get softSkillTimeManagementBody {
    return Intl.message(
      'I adeptly organize and prioritize tasks to meet deadlines without compromising quality, ensuring efficient workflows and consistently delivering results.',
      name: 'softSkillTimeManagementBody',
      desc: '',
      args: [],
    );
  }

  /// `I harness my imaginative thinking to develop original concepts and approaches, enriching projects with fresh ideas that stand out and captivate audiences.`
  String get softSkillCreativityBody {
    return Intl.message(
      'I harness my imaginative thinking to develop original concepts and approaches, enriching projects with fresh ideas that stand out and captivate audiences.',
      name: 'softSkillCreativityBody',
      desc: '',
      args: [],
    );
  }

  /// `Meticulous and thorough in my work, I meticulously attend to even the smallest elements, upholding a standard of excellence and delivering precision-driven outcomes.`
  String get softSkillAttentionToDetailBody {
    return Intl.message(
      'Meticulous and thorough in my work, I meticulously attend to even the smallest elements, upholding a standard of excellence and delivering precision-driven outcomes.',
      name: 'softSkillAttentionToDetailBody',
      desc: '',
      args: [],
    );
  }

  /// `I proactively identify opportunities for improvement and take the lead in implementing effective strategies, demonstrating a strong drive to exceed expectations and make a meaningful impact.`
  String get softSkillInitiativeBody {
    return Intl.message(
      'I proactively identify opportunities for improvement and take the lead in implementing effective strategies, demonstrating a strong drive to exceed expectations and make a meaningful impact.',
      name: 'softSkillInitiativeBody',
      desc: '',
      args: [],
    );
  }

  /// `Embracing diverse perspectives and alternative viewpoints, I foster an inclusive environment that encourages the exploration of new ideas and promotes innovative thinking.`
  String get softSkillOpenMindednessBody {
    return Intl.message(
      'Embracing diverse perspectives and alternative viewpoints, I foster an inclusive environment that encourages the exploration of new ideas and promotes innovative thinking.',
      name: 'softSkillOpenMindednessBody',
      desc: '',
      args: [],
    );
  }

  /// `Freska — Home cleaning`
  String get freskaCustomerAppName {
    return Intl.message(
      'Freska — Home cleaning',
      name: 'freskaCustomerAppName',
      desc: '',
      args: [],
    );
  }

  /// `Freska for Professionals`
  String get freskaProAppName {
    return Intl.message(
      'Freska for Professionals',
      name: 'freskaProAppName',
      desc: '',
      args: [],
    );
  }

  /// `Mobile app for customers`
  String get mobileAppForCustomersTitle {
    return Intl.message(
      'Mobile app for customers',
      name: 'mobileAppForCustomersTitle',
      desc: '',
      args: [],
    );
  }

  /// `<link href="https://freska.fi">Freska</link> is a home services company currently disrupting the traditional home services industry in the Nordics. With a focus on service quality, process optimisation, and digitalization, together with strong values that form a coherent company culture, Freska has rapidly taken a lead in the Finnish, Norwegian, and Swedish markets.`
  String get aboutFreskaDescription {
    return Intl.message(
      '<link href="https://freska.fi">Freska</link> is a home services company currently disrupting the traditional home services industry in the Nordics. With a focus on service quality, process optimisation, and digitalization, together with strong values that form a coherent company culture, Freska has rapidly taken a lead in the Finnish, Norwegian, and Swedish markets.',
      name: 'aboutFreskaDescription',
      desc: '',
      args: [],
    );
  }

  /// `Improvements`
  String get improvementsTitle {
    return Intl.message(
      'Improvements',
      name: 'improvementsTitle',
      desc: '',
      args: [],
    );
  }

  /// `I joined Freska’s tech team and started to work on their existing mobile app in October 2020. The app had already been in production for one and a half years straight. It already had a decent amount of features, but I was able to improve the performance and make it more user-friendly.\n\nYou can <bold>tap</bold> or <bold>hover</bold> over the screenshots to see how it looked like!`
  String get joinFreskaTechTeamAndImproveTheAppDescription {
    return Intl.message(
      'I joined Freska’s tech team and started to work on their existing mobile app in October 2020. The app had already been in production for one and a half years straight. It already had a decent amount of features, but I was able to improve the performance and make it more user-friendly.\n\nYou can <bold>tap</bold> or <bold>hover</bold> over the screenshots to see how it looked like!',
      name: 'joinFreskaTechTeamAndImproveTheAppDescription',
      desc: '',
      args: [],
    );
  }

  /// `Features and Functionality`
  String get featuresAndFunctionalityTitle {
    return Intl.message(
      'Features and Functionality',
      name: 'featuresAndFunctionalityTitle',
      desc: '',
      args: [],
    );
  }

  /// `iOS and Android Platforms`
  String get featuresAndFunctionalityIosAndAndroidPlatforms {
    return Intl.message(
      'iOS and Android Platforms',
      name: 'featuresAndFunctionalityIosAndAndroidPlatforms',
      desc: '',
      args: [],
    );
  }

  /// `User Authentication`
  String get featuresAndFunctionalityUserAuthentication {
    return Intl.message(
      'User Authentication',
      name: 'featuresAndFunctionalityUserAuthentication',
      desc: '',
      args: [],
    );
  }

  /// `Booking/Subscription Management`
  String get featuresAndFunctionalityBookingSubscriptionManagement {
    return Intl.message(
      'Booking/Subscription Management',
      name: 'featuresAndFunctionalityBookingSubscriptionManagement',
      desc: '',
      args: [],
    );
  }

  /// `Profile Management`
  String get featuresAndFunctionalityProfileManagement {
    return Intl.message(
      'Profile Management',
      name: 'featuresAndFunctionalityProfileManagement',
      desc: '',
      args: [],
    );
  }

  /// `Referral Program Page`
  String get featuresAndFunctionalityReferralProgramPage {
    return Intl.message(
      'Referral Program Page',
      name: 'featuresAndFunctionalityReferralProgramPage',
      desc: '',
      args: [],
    );
  }

  /// `Communication and Special Instructions`
  String get featuresAndFunctionalityCommunicationAndSpecialInstructions {
    return Intl.message(
      'Communication and Special Instructions',
      name: 'featuresAndFunctionalityCommunicationAndSpecialInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Support Center`
  String get featuresAndFunctionalitySupportCenter {
    return Intl.message(
      'Support Center',
      name: 'featuresAndFunctionalitySupportCenter',
      desc: '',
      args: [],
    );
  }

  /// `Push Notifications`
  String get featuresAndFunctionalityPushNotifications {
    return Intl.message(
      'Push Notifications',
      name: 'featuresAndFunctionalityPushNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method Management`
  String get featuresAndFunctionalityPaymentMethodManagement {
    return Intl.message(
      'Payment Method Management',
      name: 'featuresAndFunctionalityPaymentMethodManagement',
      desc: '',
      args: [],
    );
  }

  /// `Dynamic Links Support`
  String get featuresAndFunctionalityDynamicLinksSupport {
    return Intl.message(
      'Dynamic Links Support',
      name: 'featuresAndFunctionalityDynamicLinksSupport',
      desc: '',
      args: [],
    );
  }

  /// `Dark/Light Theme`
  String get featuresAndFunctionalityDarklightTheme {
    return Intl.message(
      'Dark/Light Theme',
      name: 'featuresAndFunctionalityDarklightTheme',
      desc: '',
      args: [],
    );
  }

  /// `Configurability and Analytics`
  String get featuresAndFunctionalityConfigurabilityAndAnalytics {
    return Intl.message(
      'Configurability and Analytics',
      name: 'featuresAndFunctionalityConfigurabilityAndAnalytics',
      desc: '',
      args: [],
    );
  }

  /// `Multilingual Support`
  String get featuresAndFunctionalityMultilingualSupport {
    return Intl.message(
      'Multilingual Support',
      name: 'featuresAndFunctionalityMultilingualSupport',
      desc: '',
      args: [],
    );
  }

  /// `Achivements`
  String get achivementsTitle {
    return Intl.message(
      'Achivements',
      name: 'achivementsTitle',
      desc: '',
      args: [],
    );
  }

  /// `• Successfully created a dedicated package for shareable code and UI library components, resulting in accelerated development and enhanced component testability. Additionally, designed an interactive demo page using Flutter web to showcase these components, further improving accessibility and usability.\n• Improved the CI/CD pipeline scripts with GitHub Actions, which led to an average 38% decrease in the time needed to build and deploy the app.\n• Optimized the mobile application for different devices and screen sizes, resulting in improved usability and more pleasing visual experience.`
  String get freskaCustomerAppAchivements {
    return Intl.message(
      '• Successfully created a dedicated package for shareable code and UI library components, resulting in accelerated development and enhanced component testability. Additionally, designed an interactive demo page using Flutter web to showcase these components, further improving accessibility and usability.\n• Improved the CI/CD pipeline scripts with GitHub Actions, which led to an average 38% decrease in the time needed to build and deploy the app.\n• Optimized the mobile application for different devices and screen sizes, resulting in improved usability and more pleasing visual experience.',
      name: 'freskaCustomerAppAchivements',
      desc: '',
      args: [],
    );
  }

  /// `My GitHub`
  String get myGithubButton {
    return Intl.message(
      'My GitHub',
      name: 'myGithubButton',
      desc: '',
      args: [],
    );
  }

  /// `My LinkedIn`
  String get myLinkedInButton {
    return Intl.message(
      'My LinkedIn',
      name: 'myLinkedInButton',
      desc: '',
      args: [],
    );
  }

  /// `Translations provided on this website have been generated using <link href="https://openai.com/chatgpt">ChatGPT</link>`
  String get roughTranslationDisclaimer {
    return Intl.message(
      'Translations provided on this website have been generated using <link href="https://openai.com/chatgpt">ChatGPT</link>',
      name: 'roughTranslationDisclaimer',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Dictums> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Dictums> load(Locale locale) => Dictums.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
