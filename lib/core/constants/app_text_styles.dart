import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle get logotype => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.plum,
  );

  static TextStyle get display => GoogleFonts.inter(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.plum,
    height: 1.25,
  );

  static TextStyle get heading => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.plum,
  );

  static TextStyle get subheading => GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.charcoal,
  );

  static TextStyle get body => GoogleFonts.inter(
    fontSize: 13.5,
    color: AppColors.charcoal.withOpacity(0.72),
    height: 1.5,
  );

  static TextStyle get label => GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.charcoal,
  );

  static TextStyle get caption =>
      GoogleFonts.inter(fontSize: 11.5, color: AppColors.grey);

  static TextStyle get price => GoogleFonts.inter(
    fontSize: 13.5,
    fontWeight: FontWeight.w700,
    color: AppColors.rose,
  );

  static TextStyle get button => GoogleFonts.inter(
    fontSize: 14.5,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
}
