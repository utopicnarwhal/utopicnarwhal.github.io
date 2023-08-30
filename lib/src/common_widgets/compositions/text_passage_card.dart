import 'package:flutter/material.dart';
import 'package:portfolio/src/design_system/components/card_plus.dart';
import 'package:portfolio/src/design_system/styles/portfolio_theme.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';
import 'package:portfolio/src/utils/string_utils.dart';
import 'package:styled_text/styled_text.dart';

class TextPassageCard extends StatelessWidget {
  const TextPassageCard({super.key, required this.title, required this.body, this.footer});

  final String title;
  final String body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final double edgePadding = context.isSmallScreen ? 20 : 40;

    return CardPlus(
      padding: EdgeInsets.all(edgePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectableText(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          StyledText.selectable(
            text: body.removeRunts,
            style: Theme.of(context).textTheme.bodyLarge,
            tags: getUnifiedStyledTextTags(context),
          ),
          if (footer != null) ...[
            SizedBox(height: edgePadding / 2),
            footer!,
          ],
        ],
      ),
    );
  }
}
