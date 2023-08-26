import 'package:collection/collection.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/l10n/generated/l10n.dart';
import 'package:portfolio/src/common_widgets/dynamic_locale.dart';
import 'package:portfolio/src/common_widgets/dynamic_theme_mode.dart';
import 'package:portfolio/src/design_system/styles/always_bouncing_scrolling.dart';
import 'package:portfolio/src/design_system/styles/portfolio_theme.dart';
import 'package:portfolio/src/pages/routes.dart';

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> with WidgetsBindingObserver {
  late GoRouter _router;
  late GlobalKey _dynamicThemeModeKey;
  late GlobalKey _dynamicColorBuilderKey;
  late GlobalKey _dynamicLocaleKey;

  @override
  void initState() {
    super.initState();

    _router = GoRouter(
      // redirect to the login page if the user is not logged in
      initialLocation: '/',
      redirect: globalRedirect,
      routes: $appRoutes,
    );
    _dynamicThemeModeKey = GlobalKey();
    _dynamicColorBuilderKey = GlobalKey();
    _dynamicLocaleKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    final systemLocale = View.maybeOf(context)?.platformDispatcher.locale;
    final defaultLocale = Dictums.delegate.supportedLocales.firstWhereOrNull(
          (supportedLocale) => systemLocale?.languageCode == supportedLocale.languageCode,
        ) ??
        const Locale.fromSubtags(languageCode: 'en');

    return DynamicThemeMode(
      key: _dynamicThemeModeKey,
      defaultThemeMode: ThemeMode.system,
      builder: (context, themeMode) {
        return DynamicColorBuilder(
          key: _dynamicColorBuilderKey,
          builder: (lightDynamic, darkDynamic) {
            return DynamicLocale(
              key: _dynamicLocaleKey,
              defaultLocale: defaultLocale,
              builder: (context, locale) {
                return MaterialApp.router(
                  title: 'Utopic Portfolio',
                  debugShowCheckedModeBanner: false,
                  routerDelegate: _router.routerDelegate,
                  routeInformationParser: _router.routeInformationParser,
                  routeInformationProvider: _router.routeInformationProvider,
                  locale: locale,
                  localizationsDelegates: const [
                    Dictums.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: Dictums.delegate.supportedLocales,
                  theme: PortfolioTheme.getAppTheme(Brightness.light, lightDynamic),
                  darkTheme: PortfolioTheme.getAppTheme(Brightness.dark, darkDynamic),
                  themeMode: themeMode,
                  scrollBehavior: AlwaysBouncingScrollBehavior(),
                );
              },
            );
          },
        );
      },
    );
  }
}
