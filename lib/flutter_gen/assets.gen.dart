/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  $AssetsFontsInterGen get inter => const $AssetsFontsInterGen();
  $AssetsFontsVictorMonoGen get victorMono => const $AssetsFontsVictorMonoGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesThirdPartyGen get thirdParty => const $AssetsImagesThirdPartyGen();
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

class $AssetsImagesThirdPartyGen {
  const $AssetsImagesThirdPartyGen();

  /// File path: assets/images/third_party/freska-customer-app-icon.svg
  String get freskaCustomerAppIcon => 'assets/images/third_party/freska-customer-app-icon.svg';

  /// File path: assets/images/third_party/freska-f-icon.svg
  String get freskaFIcon => 'assets/images/third_party/freska-f-icon.svg';

  /// File path: assets/images/third_party/freska-service-workers-app-icon.svg
  String get freskaServiceWorkersAppIcon => 'assets/images/third_party/freska-service-workers-app-icon.svg';

  /// File path: assets/images/third_party/github-icon.svg
  String get githubIcon => 'assets/images/third_party/github-icon.svg';

  /// List of all assets
  List<String> get values => [freskaCustomerAppIcon, freskaFIcon, freskaServiceWorkersAppIcon, githubIcon];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
