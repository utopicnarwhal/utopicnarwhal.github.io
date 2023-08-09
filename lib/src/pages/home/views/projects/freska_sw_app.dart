import 'package:flutter/material.dart';
import 'package:portfolio/src/global_widgets/card_plus.dart';
import 'package:portfolio/src/global_widgets/layout/custom_sliver_separated_list.dart';

class FreskaServiceWorkersAppView extends StatefulWidget {
  const FreskaServiceWorkersAppView({super.key});

  @override
  State<FreskaServiceWorkersAppView> createState() => _FreskaServiceWorkersAppViewState();
}

class _FreskaServiceWorkersAppViewState extends State<FreskaServiceWorkersAppView> {
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
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          CustomSliverSeparatedList(
            separatorSize: 20,
            maxWidth: 560,
            everyChildPadding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              SelectableText(
                'Freska Pro app',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              CardPlus(
                padding: const EdgeInsets.all(40),
                child: SelectableText(
                  'Description',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ],
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 128)),
        ],
      ),
    );
  }
}
