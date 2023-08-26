part of '../home_page.dart';

abstract class _MenuItem {
  _MenuItem({
    required this.iconWidgetBuilder,
    required this.name,
    required this.pathName,
  });

  final Widget Function(BuildContext context) iconWidgetBuilder;
  final String name;
  final String pathName;
}

class _MenuFolder extends _MenuItem {
  _MenuFolder({
    required super.iconWidgetBuilder,
    required super.name,
    required super.pathName,
    required this.children,
  });

  final List<_MenuItem> children;
}

class _MenuDestination extends _MenuItem {
  _MenuDestination({
    required super.iconWidgetBuilder,
    required super.name,
    required super.pathName,
  });
}

class _PrimarySideBar extends StatelessWidget {
  const _PrimarySideBar({
    required this.scrollController,
    required this.actions,
  });

  final ScrollController scrollController;
  final List<Widget> actions;

  Iterable<Widget> buildMenu(BuildContext context, List<_MenuItem> menuStructure, [String parentDir = '']) sync* {
    const listTileContentPadding = EdgeInsets.symmetric(horizontal: 16);
    final depth = '/'.allMatches(parentDir).length + 1;

    for (var menuItem in menuStructure) {
      yield ListenableBuilder(
        listenable: GoRouter.of(context).routeInformationProvider,
        builder: (context, _) {
          final routeLocation = GoRouter.of(context).routerDelegate.currentConfiguration.uri.path;
          final menuItemRoutePath = parentDir + menuItem.pathName;

          if (menuItem is _MenuDestination) {
            return Stack(
              children: [
                ListTile(
                  key: ValueKey(menuItemRoutePath),
                  selected: menuItemRoutePath == routeLocation,
                  leading: menuItem.iconWidgetBuilder(context),
                  selectedTileColor: Theme.of(context).highlightColor.withOpacity(0.22),
                  onTap: () {
                    if (Scaffold.maybeOf(context)?.hasDrawer == true &&
                        Scaffold.maybeOf(context)?.isDrawerOpen == true) {
                      Navigator.pop(context);
                    }
                    GoRouter.of(context).go(menuItemRoutePath);
                  },
                  horizontalTitleGap: 18,
                  contentPadding: listTileContentPadding.copyWith(left: (depth * 12) + 32),
                  title: Text(
                    menuItem.name,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.left,
                  ),
                ),
                if (menuItemRoutePath == routeLocation)
                  Positioned(
                    left: 0,
                    width: 4,
                    bottom: 0,
                    top: 0,
                    child: Material(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
              ],
            );
          }

          if (menuItem is _MenuFolder) {
            return ExpansionTile(
              key: PageStorageKey(menuItemRoutePath),
              initiallyExpanded: routeLocation.startsWith(menuItemRoutePath) == true,
              maintainState: true,
              iconColor: Theme.of(context).hintColor,
              collapsedIconColor: Theme.of(context).hintColor,
              tilePadding: listTileContentPadding.copyWith(left: depth * 12),
              clipBehavior: Clip.hardEdge,
              title: Row(
                children: [
                  menuItem.iconWidgetBuilder(context),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      menuItem.name,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
              controlAffinity: ListTileControlAffinity.leading,
              childrenPadding: EdgeInsets.zero,
              children: [
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: buildMenu(context, menuItem.children, menuItemRoutePath).toList(),
                    ),
                    Positioned(
                      left: (depth * 12) + 4,
                      width: 2,
                      top: 0,
                      bottom: 0,
                      child: const VerticalDivider(
                        thickness: 1.5,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          return const SizedBox();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            ListView(
              controller: scrollController,
              padding: const EdgeInsets.only(top: 4, bottom: 128),
              children: buildMenu(context, [
                _MenuFolder(
                  iconWidgetBuilder: (context) => Icon(
                    Icons.cases_rounded,
                    color: IconTheme.of(context).color,
                  ),
                  name: 'projects',
                  pathName: '/projects',
                  children: [
                    _MenuFolder(
                      iconWidgetBuilder: (context) => SvgPicture.asset(
                        Assets.images.thirdParty.freskaFIcon,
                        height: 28,
                        width: 28,
                        colorFilter: ColorFilter.mode(IconTheme.of(context).color ?? Colors.black, BlendMode.srcIn),
                      ),
                      name: 'at_freska',
                      pathName: '/at_freska',
                      children: [
                        _MenuDestination(
                          iconWidgetBuilder: (context) => Material(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: BorderSide(color: Theme.of(context).dividerColor, strokeAlign: -0.8),
                            ),
                            child: SvgPicture.asset(
                              Assets.images.thirdParty.freskaCustomerAppIcon,
                              height: 28,
                              width: 28,
                            ),
                          ),
                          name: 'Freska — Home cleaning.app',
                          pathName: '/freska_app',
                        ),
                        _MenuDestination(
                          iconWidgetBuilder: (context) => Material(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: BorderSide(color: Theme.of(context).dividerColor, strokeAlign: -0.8),
                            ),
                            child: SvgPicture.asset(
                              Assets.images.thirdParty.freskaServiceWorkersAppIcon,
                              height: 28,
                              width: 28,
                            ),
                          ),
                          name: 'Freska for Professionals.app',
                          pathName: '/freska_pro_app',
                        ),
                      ],
                    )
                  ],
                ),
                _MenuFolder(
                  iconWidgetBuilder: (context) => Icon(
                    Icons.fact_check_rounded,
                    color: Colors.green.harmonizeWith(Theme.of(context).primaryColor),
                  ),
                  name: 'skills',
                  pathName: '/skills',
                  children: [
                    _MenuDestination(
                      iconWidgetBuilder: (context) => Icon(
                        Icons.engineering_rounded,
                        color: Colors.blueGrey.shade300.harmonizeWith(Theme.of(context).primaryColor),
                      ),
                      name: 'hard.md',
                      pathName: '/hard',
                    ),
                    _MenuDestination(
                      iconWidgetBuilder: (context) => Icon(
                        Icons.diversity_1_rounded,
                        color: Colors.pink.harmonizeWith(Theme.of(context).primaryColor),
                      ),
                      name: 'soft.md',
                      pathName: '/soft',
                    ),
                  ],
                ),
                _MenuDestination(
                  iconWidgetBuilder: (context) => Icon(
                    Icons.workspace_premium_rounded,
                    color: Colors.orange.harmonizeWith(Theme.of(context).primaryColor),
                  ),
                  name: 'LICENSES',
                  pathName: '/licenses',
                ),
                _MenuDestination(
                  iconWidgetBuilder: (context) => Icon(
                    Icons.info_rounded,
                    color: Colors.blue.harmonizeWith(Theme.of(context).primaryColor),
                  ),
                  name: 'README.md',
                  pathName: '/',
                ),
              ]).toList(),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: actions,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
