import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/l10n/generated/l10n.dart';
import 'package:portfolio/src/design_system/components/buttons/custom_icon_button.dart';
import 'package:portfolio/src/design_system/styles/motion/easing_and_durations.dart';
import 'package:portfolio/src/design_system/styles/portfolio_theme.dart';
import 'package:portfolio/src/services/local_storage_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:styled_text/styled_text.dart';

class RoughTranslationDisclaimer extends StatefulWidget {
  const RoughTranslationDisclaimer({super.key});

  @override
  State<RoughTranslationDisclaimer> createState() => _RoughTranslationDisclaimerState();
}

class _RoughTranslationDisclaimerState extends State<RoughTranslationDisclaimer> {
  late BehaviorSubject<bool> _disclaimerDismissedController;

  @override
  void initState() {
    super.initState();
    _disclaimerDismissedController = BehaviorSubject.seeded(
      LocalStorageService.instance.getRoughTranslationDisclaimerDismissed(),
    );
  }

  @override
  void dispose() {
    _disclaimerDismissedController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: _disclaimerDismissedController.value,
      stream: _disclaimerDismissedController,
      builder: (context, disclaimerDismissedSnapshot) {
        final hideDisclaimer = disclaimerDismissedSnapshot.data == true ||
            Localizations.localeOf(context).languageCode.toLowerCase() != 'fi';

        return AnimatedSlide(
          offset: Offset(0, hideDisclaimer ? 1 : 0),
          duration: MaterialDurations.medium1,
          curve: hideDisclaimer ? MaterialEasing.emphasizedDecelerate : MaterialEasing.emphasizedAccelerate,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 68),
            child: Material(
              type: MaterialType.card,
              color: Theme.of(context).colorScheme.background,
              shape: NonUniformOutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                hideBottomSide: true,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 0, 4),
                      child: StyledText(
                        text: Dictums.of(context).roughTranslationDisclaimer,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
                        tags: getUnifiedStyledTextTags(context),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  CustomIconButton(
                    onPressed: () {
                      _disclaimerDismissedController.add(true);
                      LocalStorageService.instance.setRoughTranslationDisclaimerDismissed();
                    },
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
