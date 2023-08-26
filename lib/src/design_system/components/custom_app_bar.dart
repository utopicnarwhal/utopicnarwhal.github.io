import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/src/design_system/styles/portfolio_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.title,
    this.actions,
    this.isTransparent = false,
    this.centerTitle,
    this.leading,
    this.leadingWidth,
    this.systemOverlayStyle,
    Key? key,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final Widget? title;
  final List<Widget>? actions;
  final bool isTransparent;
  final bool? centerTitle;
  final Widget? leading;
  final double? leadingWidth;
  final SystemUiOverlayStyle? systemOverlayStyle;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      actions: actions,
      leading: leading,
      leadingWidth: leadingWidth,
      automaticallyImplyLeading: false,
      elevation: 0,
      systemOverlayStyle: systemOverlayStyle ?? PortfolioTheme.defaultSystemUiOverlayStyle(context),
      scrolledUnderElevation: 0,
      foregroundColor: Theme.of(context).colorScheme.onSurface,
    );
  }
}
