import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

part 'input_decoration.dart';
part 'typography.dart';

const _fallbackPrimaryColor = Color(0xFFC3B1E1);

/// 16
const double kCardBorderRadius = 16;

/// 24
const double kPopupBorderRadius = 24;

/// 16
const double kTilePadding = 16;

/// iOS scroll physics but also always scrollable to make it look more interactive
const kAlwaysBouncingScrollPhysics = BouncingScrollPhysics(
  parent: AlwaysScrollableScrollPhysics(),
);

abstract class PortfolioTheme {
  static ThemeData getAppTheme(Brightness brightness, ColorScheme? colorScheme) {
    final isDark = brightness == Brightness.dark;

    colorScheme ??= ColorScheme.fromSeed(seedColor: _fallbackPrimaryColor, brightness: brightness);
    // Use primary color as a secondary and tertiary colors to make it look better
    colorScheme = colorScheme.copyWith(
      primary: colorScheme.primary,
      secondary: colorScheme.primary,
      onSecondary: colorScheme.onPrimary,
      secondaryContainer: colorScheme.primaryContainer,
      onSecondaryContainer: colorScheme.onPrimaryContainer,
      tertiary: colorScheme.primary,
      onTertiary: colorScheme.onPrimary,
      tertiaryContainer: colorScheme.primaryContainer,
      onTertiaryContainer: colorScheme.onPrimaryContainer,
    );
    final textTheme = _getTextTheme();

    // We are using "high scaffold low surface" for light theme
    final scaffoldBackgroundColor = isDark ? colorScheme.surface : colorScheme.applyTintToSurface(12);
    final inputDecorationTheme = _inputDecorationTheme(
      isDark: isDark,
      colorScheme: colorScheme,
      textTheme: textTheme,
    );

    return ThemeData(
      fontFamily: 'Inter',
      textTheme: textTheme,
      primaryColor: colorScheme.primary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      useMaterial3: true,
      brightness: brightness,
      applyElevationOverlayColor: false,
      canvasColor: colorScheme.surface,
      colorScheme: colorScheme,
      cardColor: colorScheme.applyTintToSurface(isDark ? 6 : 0),
      buttonTheme: _buttonTheme,
      dialogTheme: _dialogTheme(isDark: isDark),
      cardTheme: _cardTheme(isDark, colorScheme),
      checkboxTheme: _checkboxThemeData(colorScheme),
      dividerColor: colorScheme.outlineVariant,
      dividerTheme: _dividerTheme(colorScheme),
      popupMenuTheme: _popupMenuTheme(colorScheme),
      listTileTheme: _listTileThemeData(colorScheme),
      segmentedButtonTheme: _segmentedButtonThemeData(colorScheme),
      expansionTileTheme: _expansionTileThemeData(colorScheme),
      dropdownMenuTheme: _dropdownMenuTheme(inputDecorationTheme),
      splashFactory: InkSparkle.splashFactory,
      splashColor: colorScheme.applyTintToSurface(8),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(44, 44))),
      ),
      chipTheme: _chipThemeData(textTheme, colorScheme),
      tooltipTheme: _tooltipTheme(colorScheme),
      tabBarTheme: _tabBarTheme(colorScheme, textTheme),
      appBarTheme: _appBarTheme(isDark: isDark, colorScheme: colorScheme),
      floatingActionButtonTheme: _floatingActionButtonTheme(isDark, colorScheme),
      inputDecorationTheme: inputDecorationTheme,
    );
  }

  static SystemUiOverlayStyle defaultSystemUiOverlayStyle(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return lightSystemUiOverlayStyle(context);
    }
    return darkSystemUiOverlayStyle(context);
  }

  /// For black background
  static SystemUiOverlayStyle lightSystemUiOverlayStyle(BuildContext context) {
    return const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarContrastEnforced: false,
      systemStatusBarContrastEnforced: false,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    );
  }

  /// For white background
  static SystemUiOverlayStyle darkSystemUiOverlayStyle(BuildContext context) {
    return const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarContrastEnforced: false,
      systemStatusBarContrastEnforced: false,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
  }

  static CheckboxThemeData _checkboxThemeData(ColorScheme colorScheme) {
    return CheckboxThemeData(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 2),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  static ListTileThemeData _listTileThemeData(ColorScheme colorScheme) {
    return ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(horizontal: kTilePadding, vertical: kTilePadding - 10),
      minLeadingWidth: 0,
      minVerticalPadding: 14,
      iconColor: colorScheme.onSurface,
      horizontalTitleGap: 12,
    );
  }

  static SegmentedButtonThemeData _segmentedButtonThemeData(ColorScheme colorScheme) {
    return SegmentedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStatePropertyAll(
          BorderSide(
            width: 1.5,
            strokeAlign: -1.5 / 2,
            color: colorScheme.outline.withOpacity(0.2),
          ),
        ),
      ),
    );
  }

  static ExpansionTileThemeData _expansionTileThemeData(ColorScheme colorScheme) {
    return ExpansionTileThemeData(
      shape: Border.all(width: 0, style: BorderStyle.none),
      collapsedShape: Border.all(width: 0, style: BorderStyle.none),
      iconColor: colorScheme.onSurface,
      collapsedIconColor: colorScheme.onSurface,
      childrenPadding: const EdgeInsets.all(kTilePadding).copyWith(top: 0),
      expandedAlignment: Alignment.topLeft,
    );
  }

  static ChipThemeData _chipThemeData(TextTheme textTheme, ColorScheme colorScheme) {
    return ChipThemeData(
      labelStyle: textTheme.labelMedium?.copyWith(color: colorScheme.primary),
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: colorScheme.primary, size: 20),
      side: BorderSide(
        width: 1,
        strokeAlign: -1 / 2,
        color: colorScheme.surfaceVariant,
      ),
      padding: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  static TabBarTheme _tabBarTheme(ColorScheme colorScheme, TextTheme textTheme) {
    return TabBarTheme(
      labelColor: colorScheme.onPrimary,
      labelStyle: textTheme.titleSmall?.copyWith(color: colorScheme.onPrimary),
      unselectedLabelColor: colorScheme.onSecondaryContainer,
      unselectedLabelStyle: textTheme.titleSmall?.copyWith(color: colorScheme.onSecondaryContainer),
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(200),
      ),
      dividerColor: Colors.transparent,
      labelPadding: const EdgeInsets.symmetric(horizontal: 29, vertical: 0),
    );
  }

  static AppBarTheme _appBarTheme({
    required bool isDark,
    required ColorScheme colorScheme,
  }) {
    final double elevation = isDark ? 8 : 0;

    return AppBarTheme(
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      backgroundColor: colorScheme.applyTintToSurface(elevation),
      surfaceTintColor: colorScheme.surfaceTint,
    );
  }

  static FloatingActionButtonThemeData? _floatingActionButtonTheme(bool isDark, ColorScheme colorScheme) {
    return const FloatingActionButtonThemeData(
      smallSizeConstraints: BoxConstraints.tightFor(height: 44, width: 44),
    );
  }

  static const _buttonTheme = ButtonThemeData(
    padding: EdgeInsets.zero,
    shape: StadiumBorder(),
  );

  static CardTheme _cardTheme(bool isDark, ColorScheme colorScheme) {
    Color? color;
    late double elevation;
    elevation = isDark ? 6 : 1;

    return CardTheme(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.zero,
      elevation: elevation,
      color: color,
      surfaceTintColor: colorScheme.surfaceTint,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCardBorderRadius),
      ),
    );
  }

  static DialogTheme _dialogTheme({required bool isDark}) {
    return DialogTheme(
      elevation: isDark ? 6 : 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kPopupBorderRadius),
      ),
    );
  }

  static TooltipThemeData _tooltipTheme(ColorScheme colorScheme) {
    return TooltipThemeData(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: colorScheme.inverseSurface,
      ),
    );
  }

  static DividerThemeData _dividerTheme(ColorScheme colorScheme) {
    return DividerThemeData(
      color: colorScheme.surfaceVariant,
      space: 1,
      thickness: 1,
    );
  }

  static PopupMenuThemeData _popupMenuTheme(ColorScheme colorScheme) {
    return PopupMenuThemeData(
      color: colorScheme.applyTintToSurface(3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  static DropdownMenuThemeData _dropdownMenuTheme(InputDecorationTheme inputDecorationTheme) {
    return DropdownMenuThemeData(
      inputDecorationTheme: inputDecorationTheme,
      textStyle: inputDecorationTheme.labelStyle,
    );
  }
}

double surfaceLevelToElevation(int surfaceLevel) {
  if (surfaceLevel <= 0) {
    return 0;
  }
  return {
        1: 1.0,
        2: 3.0,
        3: 6.0,
        4: 8.0,
        5: 12.0,
      }[surfaceLevel] ??
      12.0;
}

extension ColorSchemeExtensions on ColorScheme {
  /// const List<_ElevationOpacity> _surfaceTintElevationOpacities = <_ElevationOpacity>[
  ///   _ElevationOpacity(0.0, 0.0),   // Surface level 0
  ///   _ElevationOpacity(1.0, 0.05),  // Surface level 1
  ///   _ElevationOpacity(3.0, 0.08),  // Surface level 2
  ///   _ElevationOpacity(6.0, 0.11),  // Surface level 3
  ///   _ElevationOpacity(8.0, 0.12),  // Surface level 4
  ///   _ElevationOpacity(12.0, 0.14), // Surface level 5
  /// ];
  Color applyTintToSurface(double elevation, [Color? tint]) {
    return ElevationOverlay.applySurfaceTint(surface, tint ?? surfaceTint, elevation);
  }
}
