import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:portfolio/flutter_gen/assets.gen.dart';
import 'package:portfolio/src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  LicenseRegistry.addLicense(
    () => Stream<LicenseEntry>.fromFutures([
      rootBundle.loadString(Assets.fonts.victorMono.ofl).then((licenseText) {
        return LicenseEntryWithLineBreaks(<String>['Victor Mono'], licenseText);
      }),
      rootBundle.loadString(Assets.fonts.inter.ofl).then((licenseText) {
        return LicenseEntryWithLineBreaks(<String>['Inter'], licenseText);
      }),
    ]),
  );

  runApp(const PortfolioApp());
}
