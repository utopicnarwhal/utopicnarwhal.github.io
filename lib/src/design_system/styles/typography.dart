part of '../../design_system/styles/portfolio_theme.dart';

TextTheme _getTextTheme() {
  const textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'VictorMono',
      fontSize: 57,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontFamily: 'VictorMono',
      fontSize: 45,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      fontFamily: 'VictorMono',
      fontSize: 36,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'VictorMono',
      fontSize: 32,
      fontWeight: FontWeight.w800,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'VictorMono',
      fontSize: 28,
      fontWeight: FontWeight.w800,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'VictorMono',
      fontSize: 24,
      fontWeight: FontWeight.w800,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 30,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Inter',
      fontSize: 20,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.2,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 17,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.1,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 1,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 20,
      fontWeight: FontWeight.w300,
      letterSpacing: 0,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 17,
      fontWeight: FontWeight.w300,
      letterSpacing: 0,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
      fontWeight: FontWeight.w300,
      letterSpacing: 0,
    ),
  );

  return textTheme;
}

Map<String, StyledTextTagBase> getUnifiedStyledTextTags(BuildContext context) {
  return {
    'bold': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold)),
    'link': StyledTextActionTag(
      (String? text, Map<String?, String?> attrs) {
        final link = attrs['href'];
        if (link != null) {
          final parsedLink = Uri.tryParse(link);
          if (parsedLink != null) {
            url_launcher.launchUrl(parsedLink);
          }
        }
      },
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
    ),
  };
}
