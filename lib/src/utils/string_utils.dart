extension StringExtension on String {
  String get sanitiseForStyledText {
    return replaceAll('"', '&quot;')
        .replaceAll('\'', '&apos;')
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&rt;')
        .replaceAll(' ', '&space;');
  }
}
