import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor/utils/custom_colors.dart';

class CustomTextStyle {
  static TextStyle logoTextStyle =
      GoogleFonts.rubikMicrobe(color: CustomColors.orangeColor, fontSize: 50);
  static TextStyle subtitleGreyTextStyle =
      GoogleFonts.robotoMono(color: Colors.grey.shade400, fontSize: 16);
  static TextStyle titleWhiteTextStyle =
      GoogleFonts.robotoMono(color: CustomColors.whiteColor, fontSize: 16);
}
