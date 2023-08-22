/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/under_construction.riv
  String get underConstruction => 'assets/animations/under_construction.riv';

  /// File path: assets/animations/utopic_narwhal.riv
  String get utopicNarwhal => 'assets/animations/utopic_narwhal.riv';

  /// List of all assets
  List<String> get values => [underConstruction, utopicNarwhal];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  $AssetsFontsInterGen get inter => const $AssetsFontsInterGen();
  $AssetsFontsVictorMonoGen get victorMono => const $AssetsFontsVictorMonoGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesIllustrationsGen get illustrations => const $AssetsImagesIllustrationsGen();
  $AssetsImagesThirdPartyGen get thirdParty => const $AssetsImagesThirdPartyGen();
}

class $AssetsVideosGen {
  const $AssetsVideosGen();

  /// File path: assets/videos/firebase_hero_loop.webm
  String get firebaseHeroLoop => 'assets/videos/firebase_hero_loop.webm';

  /// File path: assets/videos/flutter_developing.mp4
  String get flutterDeveloping => 'assets/videos/flutter_developing.mp4';

  /// File path: assets/videos/responsive_layout.mp4
  String get responsiveLayout => 'assets/videos/responsive_layout.mp4';

  /// List of all assets
  List<String> get values => [firebaseHeroLoop, flutterDeveloping, responsiveLayout];
}

class $AssetsFontsInterGen {
  const $AssetsFontsInterGen();

  /// File path: assets/fonts/inter/OFL.txt
  String get ofl => 'assets/fonts/inter/OFL.txt';

  /// List of all assets
  List<String> get values => [ofl];
}

class $AssetsFontsVictorMonoGen {
  const $AssetsFontsVictorMonoGen();

  /// File path: assets/fonts/victor_mono/OFL.txt
  String get ofl => 'assets/fonts/victor_mono/OFL.txt';

  /// List of all assets
  List<String> get values => [ofl];
}

class $AssetsImagesIllustrationsGen {
  const $AssetsImagesIllustrationsGen();

  /// File path: assets/images/illustrations/app_deployment.png
  AssetGenImage get appDeployment => const AssetGenImage('assets/images/illustrations/app_deployment.png');

  /// File path: assets/images/illustrations/cicd.png
  AssetGenImage get cicd => const AssetGenImage('assets/images/illustrations/cicd.png');

  /// File path: assets/images/illustrations/dart_aot_compile.svg
  String get dartAotCompile => 'assets/images/illustrations/dart_aot_compile.svg';

  /// File path: assets/images/illustrations/design_system.png
  AssetGenImage get designSystem => const AssetGenImage('assets/images/illustrations/design_system.png');

  /// File path: assets/images/illustrations/i18n.svg
  String get i18n => 'assets/images/illustrations/i18n.svg';

  /// File path: assets/images/illustrations/material_design.png
  AssetGenImage get materialDesign => const AssetGenImage('assets/images/illustrations/material_design.png');

  /// File path: assets/images/illustrations/version_control.svg
  String get versionControl => 'assets/images/illustrations/version_control.svg';

  /// List of all assets
  List<dynamic> get values => [appDeployment, cicd, dartAotCompile, designSystem, i18n, materialDesign, versionControl];
}

class $AssetsImagesThirdPartyGen {
  const $AssetsImagesThirdPartyGen();

  /// File path: assets/images/third_party/firebase_logomark.svg
  String get firebaseLogomark => 'assets/images/third_party/firebase_logomark.svg';

  /// File path: assets/images/third_party/freska-customer-app-icon.svg
  String get freskaCustomerAppIcon => 'assets/images/third_party/freska-customer-app-icon.svg';

  /// File path: assets/images/third_party/freska-f-icon.svg
  String get freskaFIcon => 'assets/images/third_party/freska-f-icon.svg';

  /// File path: assets/images/third_party/freska-service-workers-app-icon.svg
  String get freskaServiceWorkersAppIcon => 'assets/images/third_party/freska-service-workers-app-icon.svg';

  /// File path: assets/images/third_party/git_logomark.svg
  String get gitLogomark => 'assets/images/third_party/git_logomark.svg';

  /// File path: assets/images/third_party/github_actions_logomark.svg
  String get githubActionsLogomark => 'assets/images/third_party/github_actions_logomark.svg';

  /// File path: assets/images/third_party/github_icon.svg
  String get githubIcon => 'assets/images/third_party/github_icon.svg';

  /// File path: assets/images/third_party/google_material_design_logo.svg
  String get googleMaterialDesignLogo => 'assets/images/third_party/google_material_design_logo.svg';

  /// File path: assets/images/third_party/logo_dart.svg
  String get logoDart => 'assets/images/third_party/logo_dart.svg';

  /// List of all assets
  List<String> get values => [
        firebaseLogomark,
        freskaCustomerAppIcon,
        freskaFIcon,
        freskaServiceWorkersAppIcon,
        gitLogomark,
        githubActionsLogomark,
        githubIcon,
        googleMaterialDesignLogo,
        logoDart
      ];
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsVideosGen videos = $AssetsVideosGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
