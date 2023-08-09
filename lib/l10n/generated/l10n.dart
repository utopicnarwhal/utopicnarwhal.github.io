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
}

class AppLocalizationDelegate extends LocalizationsDelegate<Dictums> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
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
