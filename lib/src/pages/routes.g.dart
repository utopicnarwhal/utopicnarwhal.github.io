// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
    ];

RouteBase get $homeRoute => ShellRouteData.$route(
      navigatorKey: HomeRoute.$navigatorKey,
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/projects/at_freska/freska_app',
          name: 'Freska App',
          factory: $FreskaCustomerAppProjectRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/projects/at_freska/freska_pro_app',
          name: 'Freska Pro App',
          factory: $FreskaServiceWorkersAppProjectRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/skills/hard',
          name: 'Hard skills',
          factory: $HardSkillsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/skills/soft',
          name: 'Soft skills',
          factory: $SoftSkillsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/licenses',
          name: 'Licenses',
          factory: $LicensesRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/',
          name: 'Home',
          factory: $IntroRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();
}

extension $FreskaCustomerAppProjectRouteExtension
    on FreskaCustomerAppProjectRoute {
  static FreskaCustomerAppProjectRoute _fromState(GoRouterState state) =>
      FreskaCustomerAppProjectRoute();

  String get location => GoRouteData.$location(
        '/projects/at_freska/freska_app',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FreskaServiceWorkersAppProjectRouteExtension
    on FreskaServiceWorkersAppProjectRoute {
  static FreskaServiceWorkersAppProjectRoute _fromState(GoRouterState state) =>
      FreskaServiceWorkersAppProjectRoute();

  String get location => GoRouteData.$location(
        '/projects/at_freska/freska_pro_app',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HardSkillsRouteExtension on HardSkillsRoute {
  static HardSkillsRoute _fromState(GoRouterState state) =>
      const HardSkillsRoute();

  String get location => GoRouteData.$location(
        '/skills/hard',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SoftSkillsRouteExtension on SoftSkillsRoute {
  static SoftSkillsRoute _fromState(GoRouterState state) =>
      const SoftSkillsRoute();

  String get location => GoRouteData.$location(
        '/skills/soft',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LicensesRouteExtension on LicensesRoute {
  static LicensesRoute _fromState(GoRouterState state) => LicensesRoute();

  String get location => GoRouteData.$location(
        '/licenses',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $IntroRouteExtension on IntroRoute {
  static IntroRoute _fromState(GoRouterState state) => IntroRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
