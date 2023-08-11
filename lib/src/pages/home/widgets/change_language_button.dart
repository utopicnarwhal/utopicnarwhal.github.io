part of '../home_page.dart';

class _ChangeLanguageButton extends StatefulWidget {
  const _ChangeLanguageButton({Key? key}) : super(key: key);

  @override
  State<_ChangeLanguageButton> createState() => _ChangeLanguageButtonState();
}

class _ChangeLanguageButtonState extends State<_ChangeLanguageButton> {
  late FocusNode _buttonFocusNode;

  @override
  void initState() {
    super.initState();
    _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');
  }

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      childFocusNode: _buttonFocusNode,
      menuChildren: [
        for (var supportedLocale in Dictums.delegate.supportedLocales)
          MenuItemButton(
            child: Text({'en': 'English', 'ru': 'Russian'}[supportedLocale.toLanguageTag()] ?? 'Unknown'),
            onPressed: () {
              DynamicLocale.of(context)?.setLocale(supportedLocale);
            },
          ),
      ],
      builder: (context, controller, _) {
        return CustomIconButton(
          tooltip: Dictums.of(context).changeLanguageButtonTooltip,
          focusNode: _buttonFocusNode,
          icon: const Icon(Icons.translate_rounded),
          type: context.isSmallScreen ? CustomIconButtonType.outlined : CustomIconButtonType.standard,
          isSelected: false,
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
        );
      },
    );
  }
}
