const int nbspCharCode = 0x00A0;

extension StringExtension on String {
  String get sanitiseForStyledText {
    return replaceAll('"', '&quot;')
        .replaceAll('\'', '&apos;')
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&rt;')
        .replaceAll(' ', '&space;');
  }

  String get removeRunts {
    // If the string in shorter then 23 visual symbols — don't do the runts removal
    if (runes.length < 23) {
      return this;
    }
    final List<String> result = [];
    for (var block in split('\n')) {
      final splitBySpace = block.split(' ');

      if (splitBySpace.length == 1 || splitBySpace.last.length >= 10 || splitBySpace.last.isEmpty) {
        result.add(block);
        continue;
      }

      result.add(
        block.replaceFirst(
          ' ',
          String.fromCharCode(nbspCharCode),
          block.length - splitBySpace.last.length - 1,
        ),
      );
    }

    return result.join('\n');
  }

  String get makeHyphensNonBreakable {
    return replaceAll('-', '-\ufeff');
  }
}
