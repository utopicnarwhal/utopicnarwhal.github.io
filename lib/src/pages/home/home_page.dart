import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/flutter_gen/assets.gen.dart';
import 'package:portfolio/l10n/generated/l10n.dart';
import 'package:portfolio/src/design_system/components/buttons/custom_button.dart';
import 'package:portfolio/src/design_system/components/buttons/custom_icon_button.dart';
import 'package:portfolio/src/design_system/components/custom_bottom_sheet.dart';
import 'package:portfolio/src/design_system/layout/custom_scaffold.dart';
import 'package:portfolio/src/common_widgets/dynamic_locale.dart';
import 'package:portfolio/src/common_widgets/dynamic_theme_mode.dart';
import 'package:portfolio/src/pages/home/widgets/rough_translation_disclaimer.dart';
import 'package:portfolio/src/services/clipboard_service.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

part 'widgets/change_language_button.dart';
part 'widgets/change_theme_mode_button.dart';
part 'widgets/contact_me_button.dart';
part 'widgets/primary_side_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.child, super.key});

  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  late ScrollController _primarySidebarScrollController;
  late GlobalKey<ScaffoldState> _scaffoldGlobalKey;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _primarySidebarScrollController = ScrollController();
    _scaffoldGlobalKey = GlobalKey<ScaffoldState>(debugLabel: '_scaffoldGlobalKey');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _primarySidebarScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = context.isSmallScreen;
    final commonActions = [
      const _ChangeLanguageButton(),
      const _ChangeThemeButton(),
    ];

    return CustomScaffold(
      scaffoldGlobalKey: _scaffoldGlobalKey,
      appBarTitle: Dictums.of(context).homePageAppBarTitle,
      primarySidebar: _PrimarySideBar(
        scrollController: _primarySidebarScrollController,
        actions: isSmallScreen ? commonActions : [],
      ),
      actions: [
        if (!isSmallScreen) ...[
          const SizedBox(width: 12),
          for (var action in commonActions) ...[
            action,
            const SizedBox(width: 4),
          ],
        ],
        const SizedBox(width: 8),
        const _ContactMeButton(),
        const SizedBox(width: 12),
      ],
      body: widget.child,
      bodyFooter: const RoughTranslationDisclaimer(),
    );
  }
}
