import 'package:flutter/material.dart';
import 'package:portfolio/src/services/local_storage_service.dart';
import 'package:rxdart/rxdart.dart';

class DynamicThemeMode extends StatefulWidget {
  const DynamicThemeMode({
    required this.builder,
    this.defaultThemeMode = ThemeMode.system,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext context, ThemeMode data) builder;

  final ThemeMode defaultThemeMode;

  @override
  State<DynamicThemeMode> createState() => DynamicThemeModeState();

  static DynamicThemeModeState? of(BuildContext context) {
    return context.findAncestorStateOfType<DynamicThemeModeState>();
  }
}

class DynamicThemeModeState extends State<DynamicThemeMode> {
  late BehaviorSubject<ThemeMode> themeModeController;

  @override
  void initState() {
    super.initState();
    themeModeController = BehaviorSubject.seeded(_loadThemeMode());
  }

  @override
  void dispose() {
    themeModeController.close();
    super.dispose();
  }

  Future<void> setThemeMode(ThemeMode newThemeMode) async {
    themeModeController.add(newThemeMode);
    await LocalStorageService.instance.setThemeMode(newThemeMode);
  }

  ThemeMode _loadThemeMode() {
    return LocalStorageService.instance.getThemeMode() ?? widget.defaultThemeMode;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeMode>(
      stream: themeModeController,
      builder: (context, themeModeSnapshot) {
        return widget.builder(context, themeModeSnapshot.data ?? widget.defaultThemeMode);
      },
    );
  }
}
