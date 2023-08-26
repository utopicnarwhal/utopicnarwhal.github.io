import 'package:flutter/material.dart';

abstract class MaterialDurations {
  // https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#97194be9-de1c-41b9-90d4-21ae2b8d3f38
  /// 50 milliseconds
  static const short1 = Duration(milliseconds: 50);

  /// 100 milliseconds
  static const short2 = Duration(milliseconds: 100);

  /// 150 milliseconds
  static const short3 = Duration(milliseconds: 150);

  /// 200 milliseconds
  static const short4 = Duration(milliseconds: 200);

  // https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#e08d2356-1831-4375-bc2f-6d45230c6d98
  /// 250 milliseconds
  static const medium1 = Duration(milliseconds: 250);

  /// 300 milliseconds
  static const medium2 = Duration(milliseconds: 300);

  /// 350 milliseconds
  static const medium3 = Duration(milliseconds: 350);

  /// 400 milliseconds
  static const medium4 = Duration(milliseconds: 400);

  // https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#48bf653e-46f9-48f5-87e0-eaf8ea3fe716
  /// 450 milliseconds
  static const long1 = Duration(milliseconds: 450);

  /// 500 milliseconds
  static const long2 = Duration(milliseconds: 500);

  /// 550 milliseconds
  static const long3 = Duration(milliseconds: 550);

  /// 600 milliseconds
  static const long4 = Duration(milliseconds: 600);

  // https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#ee9dbe95-70fa-4804-8347-c4fd58c60fe2
  /// 700 milliseconds
  static const extraLong1 = Duration(milliseconds: 700);

  /// 800 milliseconds
  static const extraLong2 = Duration(milliseconds: 800);

  /// 900 milliseconds
  static const extraLong3 = Duration(milliseconds: 900);

  /// 1000 milliseconds
  static const extraLong4 = Duration(milliseconds: 1000);
}

abstract class MaterialEasing {
  // https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#cbea5c6e-7b0d-47a0-98c3-767080a38d95
  static const emphasized = Curves.easeInOutCubicEmphasized;
  static const emphasizedDecelerate = Cubic(0.05, 0.7, 0.1, 1.0);
  static const emphasizedAccelerate = Cubic(0.3, 0.0, 0.8, 0.15);

  // https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#2639a6e2-9007-4bca-b44a-f398b6a69382
  static const standard = Cubic(0.2, 0.0, 0, 1.0);
  static const standardDecelerate = Cubic(0, 0, 0, 1);
  static const standardAccelerate = Cubic(0.3, 0, 1, 1);
}
