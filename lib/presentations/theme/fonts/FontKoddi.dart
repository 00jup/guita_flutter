// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';

enum Koddi {
  regular('KoddiUDOnGothic-Regular'),
  bold('KoddiUDOnGothic-Bold'),
  extraBold('KoddiUDOnGothic-ExtraBold');

  const Koddi(this.fontFamily);
  final String fontFamily;
}

extension FontKoddiExtension on Widget {
  Widget fontKoddi(
    double size, {
    Color? color,
    Koddi weight = Koddi.regular,
    double? lineHeight,
  }) {
    return DefaultTextStyle.merge(
      style: TextStyle(
        fontFamily: weight.fontFamily,
        fontSize: size,
        color: color,
        height: lineHeight != null ? lineHeight / size : 1.4,
      ),
      child: this,
    );
  }
}

class FontKoddi {
  static const String _defaultFontFamily = 'KoddiUDOnGothic-Regular';

  static TextTheme applyToTextTheme(TextTheme baseTheme) {
    return baseTheme.apply(fontFamily: _defaultFontFamily);
  }
}
