import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DynamicThemeMode extends StatefulWidget {
  const DynamicThemeMode({
    required this.builder,
    this.defaultThemeMode = ThemeMode.system,
    this.onlyDarkAndLight = false,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext context, ThemeMode data) builder;

  final ThemeMode defaultThemeMode;

  final bool onlyDarkAndLight;

  @override
  State<DynamicThemeMode> createState() => DynamicThemeModeState();

  static DynamicThemeModeState? of(BuildContext context) {
    return context.findAncestorStateOfType<DynamicThemeModeState>();
  }
}

class DynamicThemeModeState extends State<DynamicThemeMode> {
  static const String _sharedPreferencesKey = 'themeMode';

  late BehaviorSubject<ThemeMode> themeModeController;

  @override
  void initState() {
    super.initState();
    themeModeController = BehaviorSubject.seeded(filterThemeMode(widget.defaultThemeMode));

    _loadThemeMode().then((themeMode) {
      if (mounted) {
        themeModeController.add(filterThemeMode(themeMode));
      }
    });
  }

  ThemeMode filterThemeMode(ThemeMode? themeMode) {
    themeMode ??= ThemeMode.system;
    return themeMode == ThemeMode.system && widget.onlyDarkAndLight ? ThemeMode.light : themeMode;
  }

  @override
  void dispose() {
    themeModeController.close();
    super.dispose();
  }

  Future<void> setThemeMode(ThemeMode newThemeMode) async {
    themeModeController.add(filterThemeMode(newThemeMode));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_sharedPreferencesKey, filterThemeMode(newThemeMode).index);
  }

  Future<ThemeMode> _loadThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var themeModeIndex = prefs.getInt(_sharedPreferencesKey);
    if (themeModeIndex == null || themeModeIndex >= ThemeMode.values.length) {
      themeModeIndex = filterThemeMode(widget.defaultThemeMode).index;
    }
    return filterThemeMode(ThemeMode.values.elementAt(themeModeIndex));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeMode>(
      stream: themeModeController,
      builder: (context, themeModeSnapshot) {
        return widget.builder(context, filterThemeMode(themeModeSnapshot.data));
      },
    );
  }
}
