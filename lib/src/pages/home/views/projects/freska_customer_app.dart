import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/flutter_gen/assets.gen.dart';
import 'package:portfolio/l10n/generated/l10n.dart';
import 'package:portfolio/src/common_widgets/compositions/on_hover_switcher.dart';
import 'package:portfolio/src/common_widgets/compositions/screenshot_stand.dart';
import 'package:portfolio/src/common_widgets/compositions/tag_chips_wrap.dart';
import 'package:portfolio/src/common_widgets/compositions/text_passage_card.dart';
import 'package:portfolio/src/design_system/components/card_plus.dart';
import 'package:portfolio/src/design_system/layout/custom_primary_view.dart';
import 'package:portfolio/src/design_system/layout/responsive_flex.dart';
import 'package:portfolio/src/utils/responsive_layout_utils.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class FreskaCustomerAppView extends StatefulWidget {
  const FreskaCustomerAppView({super.key});

  @override
  State<FreskaCustomerAppView> createState() => _FreskaCustomerAppViewState();
}

class _FreskaCustomerAppViewState extends State<FreskaCustomerAppView> {
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
    final double edgePadding = context.isSmallScreen ? 20 : 40;

    return CustomPrimaryView(
      edgePadding: edgePadding,
      children: [
        SelectableText(
          Dictums.of(context).freskaCustomerAppName,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(height: edgePadding),
        ResponsiveFlex(
          flexes: const [4, 3],
          children: [
            TextPassageCard(
              title: Dictums.of(context).mobileAppForCustomersTitle,
              body: Dictums.of(context).aboutFreskaDescription,
              footer: Wrap(
                runSpacing: 10,
                spacing: 10,
                alignment: WrapAlignment.end,
                children: [
                  ActionChip(
                    avatar: Builder(
                      builder: (context) {
                        return SvgPicture.asset(
                          Assets.images.thirdParty.appStoreLogomark,
                          height: 48,
                          width: 48,
                          colorFilter: ColorFilter.mode(IconTheme.of(context).color ?? Colors.black, BlendMode.srcIn),
                        );
                      },
                    ),
                    label: const Text('App Store'),
                    onPressed: () {
                      url_launcher.launchUrl(
                        Uri.parse('https://itunes.apple.com/fi/app/freska/id1397364064?mt=8'),
                        mode: url_launcher.LaunchMode.externalApplication,
                      );
                    },
                  ),
                  ActionChip(
                    avatar: SvgPicture.asset(Assets.images.thirdParty.googlePlayLogomark, height: 48, width: 48),
                    label: const Text('Google Play'),
                    onPressed: () {
                      url_launcher.launchUrl(
                        Uri.parse('https://play.google.com/store/apps/details?id=net.freska.freskaapp'),
                        mode: url_launcher.LaunchMode.externalApplication,
                      );
                    },
                  ),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: ScreenshotStand(
                aspectRatio: 515 / 1072,
                child: OnHoverSwitcher(
                  regularChild: Image.asset(Assets.images.illustrations.freskaApp.homePageAfter.path),
                  hoverChild: Image.asset(Assets.images.illustrations.freskaApp.homePageBefore.path),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: edgePadding),
        ResponsiveFlex(
          flexes: const [3, 4],
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ScreenshotStand(
                aspectRatio: 515 / 1072,
                orientedToTheLeft: false,
                child: OnHoverSwitcher(
                  regularChild: Image.asset(Assets.images.illustrations.freskaApp.accountDetailsAfter.path),
                  hoverChild: Image.asset(Assets.images.illustrations.freskaApp.accountDetailsBefore.path),
                ),
              ),
            ),
            TextPassageCard(
              title: Dictums.of(context).improvementsTitle,
              body: Dictums.of(context).joinFreskaTechTeamAndImproveTheAppDescription,
            ),
          ],
        ),
        SizedBox(height: edgePadding),
        ResponsiveFlex(
          flexes: const [4, 3],
          children: [
            CardPlus(
              padding: EdgeInsets.all(edgePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SelectableText(
                    Dictums.of(context).featuresAndFunctionalityTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  TagChipsWrap(
                    strings: [
                      Dictums.of(context).featuresAndFunctionalityIosAndAndroidPlatforms,
                      Dictums.of(context).featuresAndFunctionalityUserAuthentication,
                      Dictums.of(context).featuresAndFunctionalityBookingSubscriptionManagement,
                      Dictums.of(context).featuresAndFunctionalityProfileManagement,
                      Dictums.of(context).featuresAndFunctionalityReferralProgramPage,
                      Dictums.of(context).featuresAndFunctionalityCommunicationAndSpecialInstructions,
                      Dictums.of(context).featuresAndFunctionalitySupportCenter,
                      Dictums.of(context).featuresAndFunctionalityPushNotifications,
                      Dictums.of(context).featuresAndFunctionalityPaymentMethodManagement,
                      Dictums.of(context).featuresAndFunctionalityDynamicLinksSupport,
                      Dictums.of(context).featuresAndFunctionalityDarklightTheme,
                      Dictums.of(context).featuresAndFunctionalityConfigurabilityAndAnalytics,
                      Dictums.of(context).featuresAndFunctionalityMultilingualSupport,
                    ],
                  ),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: ScreenshotStand(
                aspectRatio: 515 / 1072,
                child: OnHoverSwitcher(
                  regularChild: Image.asset(Assets.images.illustrations.freskaApp.bookingDetailsAfter.path),
                  hoverChild: Image.asset(Assets.images.illustrations.freskaApp.bookingDetailsBefore.path),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: edgePadding),
        ResponsiveFlex(
          flexes: const [3, 4],
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ScreenshotStand(
                aspectRatio: 515 / 1072,
                orientedToTheLeft: false,
                child: OnHoverSwitcher(
                  regularChild: Image.asset(Assets.images.illustrations.freskaApp.reschedulingAfter.path),
                  hoverChild: Image.asset(Assets.images.illustrations.freskaApp.reschedulingBefore.path),
                ),
              ),
            ),
            TextPassageCard(
              title: Dictums.of(context).achivementsTitle,
              body: Dictums.of(context).freskaCustomerAppAchivements,
            ),
          ],
        ),
      ],
    );
  }
}
