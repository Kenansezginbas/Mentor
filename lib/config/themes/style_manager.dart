import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';

class StyleManager {
  static TextStyle logoTextStyle =
      GoogleFonts.rubikMicrobe(color: ColorManager.orangeColor, fontSize: 50);
  static TextStyle subtitleGreyTextStyle =
      GoogleFonts.robotoMono(color: Colors.grey.shade400, fontSize: 16);
  static TextStyle titleWhiteTextStyle =
      GoogleFonts.robotoMono(color: ColorManager.whiteColor, fontSize: 16);
}
