import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:portfolio/src/design_system/components/custom_app_bar.dart';
import 'package:portfolio/src/pages/routes.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.appBarTitle,
    required this.primarySidebar,
    required this.body,
    this.bodyFooter,
    required this.scaffoldGlobalKey,
    required this.actions,
  });

  final String appBarTitle;
  final Widget primarySidebar;
  final Widget body;
  final Widget? bodyFooter;
  final GlobalKey scaffoldGlobalKey;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    Widget? drawer;
    final isSmallScreen = context.isSmallScreen;
    if (isSmallScreen) {
      drawer = Drawer(child: primarySidebar);
    }

    return Scaffold(
      key: scaffoldGlobalKey,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: CustomAppBar(
        title: InkWell(
          onTap: () => IntroRoute().go(context),
          borderRadius: BorderRadius.circular(8),
          child: Text(appBarTitle),
        ),
        leadingWidth: drawer == null ? 120 : null,
        actions: actions,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: drawer != null
          ? FloatingActionButton.small(
              onPressed: () {
                (scaffoldGlobalKey.currentState as ScaffoldState).openDrawer();
              },
              child: const Icon(Icons.arrow_forward_rounded),
            )
          : null,
      drawer: drawer,
      body: MultiSplitViewTheme(
        data: MultiSplitViewThemeData(
          dividerThickness: 4,
          // dividerPainter: DividerPainter(backgroundColor: Colors.transparent),
        ),
        child: MultiSplitView(
          controller: MultiSplitViewController(areas: [
            Area(weight: 0.25, minimalWeight: 0.15),
            Area(weight: 0.75, minimalWeight: 0.5),
          ]),
          initialAreas: [Area(minimalSize: 300)],
          dividerBuilder: (axis, index, resizable, dragging, highlighted, themeData) {
            return Material(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(4)),
              type: MaterialType.canvas,
              color: Theme.of(context).scaffoldBackgroundColor,
            );
          },
          children: [
            if (!isSmallScreen)
              FocusTraversalGroup(
                child: OverflowBox(
                  alignment: Alignment.topLeft,
                  maxWidth: MediaQuery.of(context).size.width,
                  child: primarySidebar,
                ),
              ),
            Stack(
              children: [
                Positioned.fill(
                  child: Material(
                    type: MaterialType.canvas,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                FocusTraversalGroup(child: body),
                if (bodyFooter != null)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: bodyFooter!,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
