import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

class TagChipsWrap extends StatelessWidget {
  const TagChipsWrap({required this.strings, super.key});

  final List<String> strings;

  @override
  Widget build(BuildContext context) {
    return WrapSuper(
      spacing: 8,
      lineSpacing: 8,
      wrapType: WrapType.fit,
      children: [
        for (var text in strings)
          Material(
            color: Colors.transparent,
            shape: StadiumBorder(
              side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 8, 4),
              child: SelectableText(
                text,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).hintColor),
              ),
            ),
          ),
      ],
    );
  }
}
