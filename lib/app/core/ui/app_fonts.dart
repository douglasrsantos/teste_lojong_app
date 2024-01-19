import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_lojong/app/core/ui/app_colors.dart';

class AppFonts {
  static TextStyle appBarTitle = GoogleFonts.asap(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 0,
    letterSpacing: 1.02,
  );

  static TextStyle tabBarTitleSelected = GoogleFonts.asap(
    color: const Color(0xFFBF7964),
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 0,
    letterSpacing: 1.02,
  );

  static TextStyle tabBarTitleUnselected = GoogleFonts.asap(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 0,
    letterSpacing: 1.02,
  );

  static TextStyle cardTitleText = GoogleFonts.asap(
    color: AppColors.cardTexts,
    fontSize: 13.51,
    fontWeight: FontWeight.w700,
    height: 0,
    letterSpacing: 1.13,
  );

  static TextStyle cardDescription = GoogleFonts.asap(
    color: AppColors.cardTexts,
    fontSize: 14.63,
    fontWeight: FontWeight.w400,
    height: 1.03,
  );

  static TextStyle cardTextButton = GoogleFonts.asap(
    color: AppColors.cardTexts,
    fontSize: 12.38,
    fontWeight: FontWeight.w700,
    height: 0,
    letterSpacing: 0.56,
  );

  static TextStyle detailArticlesTitle = GoogleFonts.asap(
    color: Colors.black.withOpacity(0.55),
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.10,
  );

  static TextStyle bodyTextDetailArticle = GoogleFonts.asap(
    color: AppColors.cardTexts,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static TextStyle authorDescription = GoogleFonts.asap(
    color: Colors.black.withOpacity(0.40),
    fontSize: 9,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.10,
  );

  static TextStyle authorName = GoogleFonts.asap(
    color: Colors.black.withOpacity(0.40),
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.10,
  );

  static TextStyle textShareButtonDetailArticle = GoogleFonts.asap(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 0,
    letterSpacing: 1,
  );

  static TextStyle titleErrorPage = GoogleFonts.asap(
    color: AppColors.cardTexts,
    fontSize: 13.51,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.13,
  );

  static TextStyle contentErrorPage = GoogleFonts.asap(
    color: AppColors.cardTexts,
    fontSize: 14.63,
    fontWeight: FontWeight.w400,
  );

  static TextStyle quotesCardTextButton = GoogleFonts.asap(
    color: Colors.white,
    fontSize: 12.38,
    fontWeight: FontWeight.w700,
    height: 0,
    letterSpacing: 0.56,
  );

  static TextStyle cardTextQuotes = GoogleFonts.asap(
    color: AppColors.quotesCardBlueText,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 1.12,
    letterSpacing: 0.06,
  );

  static TextStyle cardTextQuotes2 = GoogleFonts.asap(
    color: Colors.black.withOpacity(0.54),
    fontSize: 15.77,
    fontWeight: FontWeight.w700,
    height: 1.11,
    letterSpacing: 0.06,
  );

  static TextStyle cardTextQuotes3 = GoogleFonts.asap(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.12,
    letterSpacing: 0.06,
  );
}
