import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DynamicLocale extends StatefulWidget {
  const DynamicLocale({
    required this.defaultLocale,
    required this.builder,
    Key? key,
  }) : super(key: key);

  final Locale defaultLocale;
  final Widget Function(BuildContext context, Locale data) builder;

  @override
  State<DynamicLocale> createState() => DynamicLocaleState();

  static DynamicLocaleState? of(BuildContext context) {
    return context.findAncestorStateOfType<DynamicLocaleState>();
  }
}

class DynamicLocaleState extends State<DynamicLocale> {
  static const String _sharedPreferencesKey = 'Locale';

  late BehaviorSubject<Locale> localeController;

  @override
  void initState() {
    super.initState();
    localeController = BehaviorSubject.seeded(widget.defaultLocale);

    _loadLocale().then((locale) {
      if (mounted) {
        localeController.add(locale);
      }
    });
  }

  @override
  void dispose() {
    localeController.close();
    super.dispose();
  }

  Future<void> setLocale(Locale newLocale) async {
    if (newLocale == localeController.value) {
      return;
    }

    localeController.add(newLocale);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sharedPreferencesKey, newLocale.languageCode);
  }

  Future<Locale> _loadLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var localeLanguageCode = prefs.getString(_sharedPreferencesKey);
    return localeLanguageCode != null ? Locale.fromSubtags(languageCode: localeLanguageCode) : widget.defaultLocale;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Locale>(
      stream: localeController,
      builder: (context, localeSnapshot) => widget.builder(
        context,
        localeSnapshot.data ?? widget.defaultLocale,
      ),
    );
  }
}
