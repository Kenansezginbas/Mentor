import 'package:flutter/material.dart';

class ColorManager {
  static final Color yellowColor = HexColor.fromHex("#F8C930");
  static final Color orangeColor = HexColor.fromHex("#E3A751");
  static final Color darkColor = HexColor.fromHex("#323436");
  static final Color darkColor2 = HexColor.fromHex("#F404446");
  static final Color whiteColor = HexColor.fromHex("#FFFFFF");
}

extension HexColor on Color {
  static fromHex(String hex) {
    hex = hex.replaceAll("#", "");
    if (hex.length == 6) {
      hex = "FF$hex";
    }
    return Color(
      int.parse(hex, radix: 16),
    );
  }
}
