import 'package:flutter/material.dart';
import 'package:portfolio/src/global_widgets/layout/custom_sliver_separated_list.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';

/// Widgets that handles scrolling, constraints and alignment of the primary view of the [CustomScaffold]
class CustomPrimaryView extends StatefulWidget {
  const CustomPrimaryView({
    required this.children,
    required this.edgePadding,
    super.key,
  });

  final double edgePadding;
  final List<Widget> children;

  @override
  State<CustomPrimaryView> createState() => _CustomPrimaryViewState();
}

class _CustomPrimaryViewState extends State<CustomPrimaryView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: widget.edgePadding)),
          CustomSliverSeparatedList(
            everyChildPadding: EdgeInsets.symmetric(horizontal: widget.edgePadding),
            maxWidth: context.isExtraLargeScreen ? 900 : null,
            alignment: context.isExtraLargeScreen ? Alignment.topCenter : Alignment.topLeft,
            children: widget.children,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 128)),
        ],
      ),
    );
  }
}
