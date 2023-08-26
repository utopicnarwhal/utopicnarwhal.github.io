import 'package:flutter/material.dart';
import 'package:portfolio/l10n/generated/l10n.dart';
import 'package:portfolio/src/common_widgets/compositions/text_passage_card.dart';
import 'package:portfolio/src/design_system/layout/custom_primary_view.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';

class SoftSkillsView extends StatefulWidget {
  const SoftSkillsView({super.key});

  @override
  State<SoftSkillsView> createState() => _SoftSkillsViewState();
}

class _SoftSkillsViewState extends State<SoftSkillsView> {
  @override
  Widget build(BuildContext context) {
    final double edgePadding = context.isSmallScreen ? 20 : 40;

    return CustomPrimaryView(
      edgePadding: edgePadding,
      children: [
        SelectableText(
          Dictums.of(context).softSkillsTitle,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 20),
        TextPassageCard(
          title: Dictums.of(context).softSkillProblemSolving,
          body: Dictums.of(context).softSkillProblemSolvingBody,
        ),
        const SizedBox(height: 20),
        TextPassageCard(
          title: Dictums.of(context).softSkillAdaptability,
          body: Dictums.of(context).softSkillAdaptabilityBody,
        ),
        const SizedBox(height: 20),
        TextPassageCard(
          title: Dictums.of(context).softSkillCommunication,
          body: Dictums.of(context).softSkillCommunicationBody,
        ),
        const SizedBox(height: 20),
        TextPassageCard(
          title: Dictums.of(context).softSkillTeamwork,
          body: Dictums.of(context).softSkillTeamworkBody,
        ),
        const SizedBox(height: 20),
        TextPassageCard(
          title: Dictums.of(context).softSkillTimeManagement,
          body: Dictums.of(context).softSkillTimeManagementBody,
        ),
        const SizedBox(height: 20),
        TextPassageCard(
          title: Dictums.of(context).softSkillCreativity,
          body: Dictums.of(context).softSkillCreativityBody,
        ),
        const SizedBox(height: 20),
        TextPassageCard(
          title: Dictums.of(context).softSkillAttentionToDetail,
          body: Dictums.of(context).softSkillAttentionToDetailBody,
        ),
        const SizedBox(height: 20),
        TextPassageCard(
          title: Dictums.of(context).softSkillInitiative,
          body: Dictums.of(context).softSkillInitiativeBody,
        ),
        const SizedBox(height: 20),
        TextPassageCard(
          title: Dictums.of(context).softSkillOpenMindedness,
          body: Dictums.of(context).softSkillOpenMindednessBody,
        ),
      ],
    );
  }
}
