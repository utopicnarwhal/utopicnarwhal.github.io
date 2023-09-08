import 'package:flutter/material.dart';
import 'package:portfolio/src/services/local_storage_service.dart';
import 'package:rxdart/rxdart.dart';

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
  late BehaviorSubject<Locale> localeController;

  @override
  void initState() {
    super.initState();
    localeController = BehaviorSubject.seeded(_loadLocale());
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
    await LocalStorageService.instance.setLocale(newLocale.languageCode);
  }

  Locale _loadLocale() {
    var localeLanguageCode = LocalStorageService.instance.getLocale();
    return localeLanguageCode != null ? Locale.fromSubtags(languageCode: localeLanguageCode) : widget.defaultLocale;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Locale>(
      initialData: localeController.value,
      stream: localeController,
      builder: (context, localeSnapshot) => widget.builder(
        context,
        localeSnapshot.data ?? widget.defaultLocale,
      ),
    );
  }
}
