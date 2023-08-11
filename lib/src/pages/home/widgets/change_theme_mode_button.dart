part of '../home_page.dart';

class _ChangeThemeButton extends StatelessWidget {
  const _ChangeThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamicThemeMode = DynamicThemeMode.of(context);
    if (dynamicThemeMode == null) {
      return const SizedBox();
    }

    return StreamBuilder<ThemeMode>(
      initialData: dynamicThemeMode.themeModeController.valueOrNull,
      stream: dynamicThemeMode.themeModeController,
      builder: (context, themeModeSnapshot) {
        final themeMode = themeModeSnapshot.data;

        if (themeMode == null) {
          return Container();
        }

        Widget icon;
        switch (themeMode) {
          case ThemeMode.system:
            icon = const Icon(Icons.brightness_auto_rounded);
            break;
          case ThemeMode.light:
            icon = const Icon(Icons.light_mode_rounded);
            break;
          case ThemeMode.dark:
            icon = const Icon(Icons.dark_mode_rounded);
            break;
        }

        return CustomIconButton(
          key: ValueKey(icon.hashCode),
          tooltip: Dictums.of(context).toggleThemeModeButtonTooltip,
          icon: icon,
          type: context.isSmallScreen ? CustomIconButtonType.outlined : CustomIconButtonType.standard,
          isSelected: false,
          onPressed: () {
            switch (themeMode) {
              case ThemeMode.light:
                dynamicThemeMode.setThemeMode(ThemeMode.system);
                break;
              case ThemeMode.dark:
                dynamicThemeMode.setThemeMode(ThemeMode.light);
                break;
              case ThemeMode.system:
                dynamicThemeMode.setThemeMode(ThemeMode.dark);
            }
          },
        );
      },
    );
  }
}
