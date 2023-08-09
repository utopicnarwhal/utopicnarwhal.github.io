part of 'portfolio_theme.dart';

TextTheme _getTextTheme() {
  const textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'VictorMono',
      fontSize: 57,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontFamily: 'VictorMono',
      fontSize: 45,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      fontFamily: 'VictorMono',
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'VictorMono',
      fontSize: 32,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'VictorMono',
      fontSize: 28,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'VictorMono',
      fontSize: 24,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 24,
      fontWeight: FontWeight.normal,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 20,
      fontWeight: FontWeight.normal,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Inter',
      fontSize: 17,
      fontWeight: FontWeight.normal,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 20,
      fontWeight: FontWeight.w300,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 17,
      fontWeight: FontWeight.w300,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
      fontWeight: FontWeight.w300,
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
