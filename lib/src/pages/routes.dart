import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/global_widgets/effects.dart';
import 'package:portfolio/src/pages/home/home_page.dart';
import 'package:portfolio/src/pages/home/views/intro_view.dart';
import 'package:portfolio/src/pages/home/views/projects/freska_customer_app.dart';
import 'package:portfolio/src/pages/home/views/projects/freska_sw_app.dart';
import 'package:portfolio/src/pages/home/views/skills/hard_skills_view.dart';
import 'package:portfolio/src/pages/home/views/skills/soft_skills_view.dart';

part 'routes.g.dart';

Future<String?> globalRedirect(BuildContext context, GoRouterState routerState) async {
  // no need to redirect at all
  return null;
}

final GlobalKey<NavigatorState> shellNavigatorKeyHome = GlobalKey<NavigatorState>();

@TypedShellRoute<HomeRoute>(
  routes: [
    TypedGoRoute<FreskaCustomerAppProjectRoute>(path: '/projects/at_freska/freska_app', name: 'Freska App'),
    TypedGoRoute<FreskaServiceWorkersAppProjectRoute>(
      path: '/projects/at_freska/freska_pro_app',
      name: 'Freska Pro App',
    ),
    TypedGoRoute<HardSkillsRoute>(path: '/skills/hard', name: 'Hard skills'),
    TypedGoRoute<SoftSkillsRoute>(path: '/skills/soft', name: 'Soft skills'),
    TypedGoRoute<LicensesRoute>(path: '/licenses', name: 'Licenses'),
    TypedGoRoute<IntroRoute>(path: '/', name: 'Home'),
  ],
)
class HomeRoute extends ShellRouteData {
  const HomeRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKeyHome;

  @override
  Widget builder(context, state, navigator) {
    // `navigator` is `child` here
    return HomePage(child: navigator);
  }
}

class IntroRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _topLevelTransitionPage(context, state, const IntroView());
  }
}

class LicensesRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _topLevelTransitionPage(
      context,
      state,
      Theme(
        data: Theme.of(context).copyWith(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 0,
            elevation: 0,
            shadowColor: Colors.transparent,
          ),
          canvasColor: Colors.transparent,
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: LicensePage(),
        ),
      ),
    );
  }
}

class FreskaCustomerAppProjectRoute extends GoRouteData {
  FreskaCustomerAppProjectRoute();

  @override
  Page<void> buildPage(context, state) {
    return _topLevelTransitionPage(
      context,
      state,
      const FreskaCustomerAppView(),
    );
  }
}

class FreskaServiceWorkersAppProjectRoute extends GoRouteData {
  FreskaServiceWorkersAppProjectRoute();

  @override
  Page<void> buildPage(context, state) {
    return _topLevelTransitionPage(
      context,
      state,
      const FreskaServiceWorkersAppView(),
    );
  }
}

class HardSkillsRoute extends GoRouteData {
  const HardSkillsRoute();

  @override
  Page<void> buildPage(context, state) {
    return _topLevelTransitionPage(
      context,
      state,
      const HardSkillsView(),
    );
  }
}

class SoftSkillsRoute extends GoRouteData {
  const SoftSkillsRoute();

  @override
  Page<void> buildPage(context, state) {
    return _topLevelTransitionPage(
      context,
      state,
      const SoftSkillsView(),
    );
  }
}

Page<void> _topLevelTransitionPage(BuildContext context, GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: ValueKey(state.uri.path),
    child: child,
    transitionDuration: MaterialDurations.medium4,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeThroughTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        fillColor: Colors.transparent,
        child: child,
      );
    },
  );
}
