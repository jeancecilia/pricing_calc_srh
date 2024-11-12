/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class Assets {
  Assets._();

  static const AssetGenImage arrowLeft = AssetGenImage('assets/arrow_left.png');
  static const AssetGenImage arrowRight =
      AssetGenImage('assets/arrow_right.png');
  static const AssetGenImage cart = AssetGenImage('assets/cart.png');
  static const AssetGenImage chip = AssetGenImage('assets/chip.png');
  static const AssetGenImage gridImage1 =
      AssetGenImage('assets/grid_image_1.png');
  static const AssetGenImage gridImage2 =
      AssetGenImage('assets/grid_image_2.png');
  static const AssetGenImage gridImage3 =
      AssetGenImage('assets/grid_image_3.png');
  static const AssetGenImage heroSection =
      AssetGenImage('assets/hero_section.png');
  static const AssetGenImage library = AssetGenImage('assets/library.png');
  static const AssetGenImage logo = AssetGenImage('assets/logo.png');
  static const AssetGenImage medicalShield =
      AssetGenImage('assets/medical_shield.png');
  static const AssetGenImage trash = AssetGenImage('assets/trash.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        arrowLeft,
        arrowRight,
        cart,
        chip,
        gridImage1,
        gridImage2,
        gridImage3,
        heroSection,
        library,
        logo,
        medicalShield,
        trash
      ];
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
