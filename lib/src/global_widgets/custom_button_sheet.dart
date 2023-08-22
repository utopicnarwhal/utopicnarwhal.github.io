import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:portfolio/src/global_widgets/card_plus.dart';
import 'package:portfolio/src/global_widgets/portfolio_theme/portfolio_theme.dart';

Future<T?> showCustomModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder childBuilder,
  bool floating = false,
  bool isDismissible = true,
  double maxWidth = 640,
}) {
  return showModalBottomSheet<T>(
    context: context,
    constraints: BoxConstraints.loose(
      Size(
        maxWidth,
        // Use global context from navigator to cover the case when padding was removed from the aboved widget
        MediaQuery.of(context).size.height -
            (MediaQuery.of(Navigator.of(context).context).padding.top < 10
                ? 40
                : MediaQuery.of(Navigator.of(context).context).padding.top) -
            24,
      ),
    ),
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    enableDrag: true,
    elevation: Theme.of(context).brightness == Brightness.light ? 0 : 12,
    isDismissible: isDismissible,
    builder: (context) {
      final globalMediaQuery = MediaQuery.of(Navigator.of(context).context);
      final bottomPadding = globalMediaQuery.padding.bottom + globalMediaQuery.viewInsets.bottom;
      final calcCardBackgroundColor = Theme.of(context).useMaterial3
          ? Theme.of(context).colorScheme.applyTintToSurface(0)
          : ElevationOverlay.applyOverlay(context, Theme.of(context).cardColor, 1);

      return CardPlus(
        surfaceLevel: Theme.of(context).useMaterial3 ? 0 : 1,
        margin: floating
            ? EdgeInsets.fromLTRB(
                20,
                0,
                20,
                math.max(20, bottomPadding),
              )
            : EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: floating
              ? BorderRadius.circular(kCardBorderRadius)
              : const BorderRadius.vertical(
                  top: Radius.circular(kCardBorderRadius),
                ),
        ),
        padding: EdgeInsets.only(bottom: !floating ? bottomPadding : 0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              clipBehavior: Clip.none,
              padding: const EdgeInsets.only(top: 29),
              child: childBuilder(context),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 29,
              child: Container(
                // Add box decoration
                decoration: BoxDecoration(
                  // Box decoration takes a gradient
                  gradient: LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: FractionalOffset.center,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      calcCardBackgroundColor.withOpacity(1),
                      calcCardBackgroundColor.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Material(
                    color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.4),
                    shape: const StadiumBorder(),
                    child: const SizedBox(width: 42, height: 5),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
