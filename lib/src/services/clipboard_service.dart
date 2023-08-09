import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/l10n/generated/l10n.dart';

class ClipboardService {
  static Future copyAndNotify(BuildContext context, String text) {
    return Clipboard.setData(ClipboardData(text: text)).then(
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(Dictums.of(context).copyToClipboardMessage(text)),
            behavior: SnackBarBehavior.floating,
            clipBehavior: Clip.none,
            width: math.min(MediaQuery.of(context).size.width, 560) - (20 * 2),
          ),
        );
      },
    );
  }
}
