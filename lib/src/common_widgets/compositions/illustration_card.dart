import 'package:flutter/material.dart';
import 'package:portfolio/l10n/generated/l10n.dart';
import 'package:portfolio/src/design_system/components/buttons/custom_icon_button.dart';
import 'package:portfolio/src/design_system/components/card_plus.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class IllustrationCard extends StatelessWidget {
  const IllustrationCard({
    super.key,
    required this.aspectRatio,
    required this.child,
    this.background,
    this.logomark,
    this.sourceLink,
    this.iconsColor,
    this.addOutline = false,
  });

  final Widget child;
  final double aspectRatio;
  final Widget? logomark;
  final Widget? background;
  final String? sourceLink;
  final Color? iconsColor;
  final bool addOutline;

  @override
  Widget build(BuildContext context) {
    return CardPlus(
      addOutline: addOutline,
      child: Stack(
        children: [
          if (background != null) Positioned.fill(child: background!),
          AspectRatio(
            aspectRatio: aspectRatio,
            child: child,
          ),
          if (logomark != null)
            Positioned(
              top: 10,
              left: 10,
              child: logomark!,
            ),
          if (sourceLink != null)
            Positioned(
              bottom: 0,
              right: 0,
              child: CustomIconButton(
                onPressed: () {
                  url_launcher.launchUrl(Uri.parse(sourceLink!));
                },
                tooltip: Dictums.of(context).sourceTooltip,
                icon: Icon(
                  Icons.art_track_rounded,
                  color: iconsColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
