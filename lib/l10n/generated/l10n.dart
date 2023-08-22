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

  /// `Critical Thinking`
  String get softSkillCriticalThinking {
    return Intl.message(
      'Critical Thinking',
      name: 'softSkillCriticalThinking',
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

  /// `Leadership`
  String get softSkillLeadership {
    return Intl.message(
      'Leadership',
      name: 'softSkillLeadership',
      desc: '',
      args: [],
    );
  }

  /// `Conflict Resolution`
  String get softSkillConflictResolution {
    return Intl.message(
      'Conflict Resolution',
      name: 'softSkillConflictResolution',
      desc: '',
      args: [],
    );
  }

  /// `Client-Focused`
  String get softSkillClientFocused {
    return Intl.message(
      'Client-Focused',
      name: 'softSkillClientFocused',
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
