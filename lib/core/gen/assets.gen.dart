/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/facebook.png
  AssetGenImage get facebook =>
      const AssetGenImage('assets/images/facebook.png');

  /// File path: assets/images/github.png
  AssetGenImage get github => const AssetGenImage('assets/images/github.png');

  /// File path: assets/images/insta.png
  AssetGenImage get insta => const AssetGenImage('assets/images/insta.png');

  /// File path: assets/images/linkedin.png
  AssetGenImage get linkedin =>
      const AssetGenImage('assets/images/linkedin.png');

  /// File path: assets/images/profile.jpg
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.jpg');

  /// File path: assets/images/profile_side.jpg
  AssetGenImage get profileSide =>
      const AssetGenImage('assets/images/profile_side.jpg');

  $AssetsImagesServiceImagesGen get serviceImages =>
      const $AssetsImagesServiceImagesGen();
  $AssetsImagesToolsImagesGen get toolsImages =>
      const $AssetsImagesToolsImagesGen();

  /// File path: assets/images/whatsapp.png
  AssetGenImage get whatsapp =>
      const AssetGenImage('assets/images/whatsapp.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [facebook, github, insta, linkedin, profile, profileSide, whatsapp];
}

class $AssetsImagesServiceImagesGen {
  const $AssetsImagesServiceImagesGen();

  /// File path: assets/images/service_images/api.png
  AssetGenImage get api =>
      const AssetGenImage('assets/images/service_images/api.png');

  /// File path: assets/images/service_images/mobile_app.png
  AssetGenImage get mobileApp =>
      const AssetGenImage('assets/images/service_images/mobile_app.png');

  /// File path: assets/images/service_images/opensource.png
  AssetGenImage get opensource =>
      const AssetGenImage('assets/images/service_images/opensource.png');

  /// File path: assets/images/service_images/prototyping.png
  AssetGenImage get prototyping =>
      const AssetGenImage('assets/images/service_images/prototyping.png');

  /// File path: assets/images/service_images/ui_ux.png
  AssetGenImage get uiUx =>
      const AssetGenImage('assets/images/service_images/ui_ux.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [api, mobileApp, opensource, prototyping, uiUx];
}

class $AssetsImagesToolsImagesGen {
  const $AssetsImagesToolsImagesGen();

  /// File path: assets/images/tools_images/android_studio.png
  AssetGenImage get androidStudio =>
      const AssetGenImage('assets/images/tools_images/android_studio.png');

  /// File path: assets/images/tools_images/aws.png
  AssetGenImage get aws =>
      const AssetGenImage('assets/images/tools_images/aws.png');

  /// File path: assets/images/tools_images/dart.png
  AssetGenImage get dart =>
      const AssetGenImage('assets/images/tools_images/dart.png');

  /// File path: assets/images/tools_images/figma.png
  AssetGenImage get figma =>
      const AssetGenImage('assets/images/tools_images/figma.png');

  /// File path: assets/images/tools_images/firebase.png
  AssetGenImage get firebase =>
      const AssetGenImage('assets/images/tools_images/firebase.png');

  /// File path: assets/images/tools_images/flutter.png
  AssetGenImage get flutter =>
      const AssetGenImage('assets/images/tools_images/flutter.png');

  /// File path: assets/images/tools_images/git.png
  AssetGenImage get git =>
      const AssetGenImage('assets/images/tools_images/git.png');

  /// File path: assets/images/tools_images/github.png
  AssetGenImage get github =>
      const AssetGenImage('assets/images/tools_images/github.png');

  /// File path: assets/images/tools_images/python.png
  AssetGenImage get python =>
      const AssetGenImage('assets/images/tools_images/python.png');

  /// File path: assets/images/tools_images/vscode.png
  AssetGenImage get vscode =>
      const AssetGenImage('assets/images/tools_images/vscode.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        androidStudio,
        aws,
        dart,
        figma,
        firebase,
        flutter,
        git,
        github,
        python,
        vscode
      ];
}

class MyAssets {
  MyAssets._();

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
