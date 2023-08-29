import 'package:flutter/material.dart';
import 'package:portfolio/src/design_system/components/card_plus.dart';
import 'package:portfolio/src/design_system/styles/motion/transitions.dart';
import 'package:portfolio/src/design_system/styles/portfolio_theme.dart';

class ProjectPreviewCard extends StatefulWidget {
  const ProjectPreviewCard({
    required this.onTap,
    required this.medias,
    required this.mediaAspectRatio,
    required this.title,
    super.key,
  });

  final VoidCallback onTap;
  final List<Widget> medias;
  final double mediaAspectRatio;
  final String title;

  @override
  State<ProjectPreviewCard> createState() => _ProjectPreviewCardState();
}

class _ProjectPreviewCardState extends State<ProjectPreviewCard> {
  late Stream<int> _mediaSwitchPeriodicStream;

  @override
  void initState() {
    super.initState();
    _mediaSwitchPeriodicStream =
        Stream<int>.periodic(const Duration(seconds: 4), (i) => (i + 1) % widget.medias.length).asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    return CardPlus(
      onTap: widget.onTap,
      addOutline: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(kCardBorderRadius)),
            child: Container(
              color: const Color(0xFFEFEFF9),
              child: AspectRatio(
                aspectRatio: widget.mediaAspectRatio,
                child: StreamBuilder<int>(
                  initialData: 0,
                  stream: _mediaSwitchPeriodicStream,
                  builder: (context, iterationModTwoSnapshot) {
                    return ForwardAndBackwardTransition(
                      index: iterationModTwoSnapshot.data ?? 0,
                      reverse: iterationModTwoSnapshot.data == 0,
                      children: widget.medias,
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(width: 20),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: Theme.of(context).hintColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
