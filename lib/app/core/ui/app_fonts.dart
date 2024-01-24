import 'package:flutter/material.dart';
import 'package:teste_lojong/app/core/ui/app_colors.dart';

class AppFonts {
  static TextStyle appBarTitle = const TextStyle(
    fontFamily: 'Asap',
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 0,
    letterSpacing: 1.02,
  );

  static TextStyle tabBarTitleSelected = const TextStyle(
    fontFamily: 'Asap',
    color: Color(0xFFBF7964),
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 0,
    letterSpacing: 1.02,
  );

  static TextStyle tabBarTitleUnselected = const TextStyle(
    fontFamily: 'Asap',
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 0,
    letterSpacing: 1.02,
  );

  static TextStyle cardTitleText = TextStyle(
    fontFamily: 'Asap',
    color: AppColors.cardTexts,
    fontSize: 13.51,
    fontWeight: FontWeight.w700,
    height: 0,
    letterSpacing: 1.13,
  );

  static TextStyle cardDescription = TextStyle(
    fontFamily: 'Asap',
    color: AppColors.cardTexts,
    fontSize: 14.63,
    fontWeight: FontWeight.w400,
    height: 1.03,
  );

  static TextStyle cardTextButton = TextStyle(
    fontFamily: 'Asap',
    color: AppColors.cardTexts,
    fontSize: 12.38,
    fontWeight: FontWeight.w700,
    height: 0,
    letterSpacing: 0.56,
  );

  static TextStyle detailArticlesTitle = TextStyle(
    fontFamily: 'Asap',
    color: Colors.black.withOpacity(0.55),
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.10,
  );

  static TextStyle bodyTextDetailArticle = TextStyle(
    fontFamily: 'Asap',
    color: AppColors.cardTexts,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static TextStyle authorDescription = TextStyle(
    fontFamily: 'Asap',
    color: Colors.black.withOpacity(0.40),
    fontSize: 9,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.10,
  );

  static TextStyle authorName = TextStyle(
    fontFamily: 'Asap',
    color: Colors.black.withOpacity(0.40),
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.10,
  );

  static TextStyle textShareButtonDetailArticle = const TextStyle(
    fontFamily: 'Asap',
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 0,
    letterSpacing: 1,
  );

  static TextStyle titleErrorPage = TextStyle(
    fontFamily: 'Asap',
    color: AppColors.cardTexts,
    fontSize: 13.51,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.13,
  );

  static TextStyle contentErrorPage = TextStyle(
    fontFamily: 'Asap',
    color: AppColors.cardTexts,
    fontSize: 14.63,
    fontWeight: FontWeight.w400,
  );

  static TextStyle quotesCardTextButton = const TextStyle(
    fontFamily: 'Asap',
    color: Colors.white,
    fontSize: 12.38,
    fontWeight: FontWeight.w700,
    height: 0,
    letterSpacing: 0.56,
  );

  static TextStyle cardTextQuotes = TextStyle(
    fontFamily: 'Asap',
    color: AppColors.quotesCardBlueText,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 1.12,
    letterSpacing: 0.06,
  );

  static TextStyle cardTextQuotes2 = TextStyle(
    fontFamily: 'Asap',
    color: Colors.black.withOpacity(0.54),
    fontSize: 15.77,
    fontWeight: FontWeight.w700,
    height: 1.11,
    letterSpacing: 0.06,
  );

  static TextStyle cardTextQuotes3 = const TextStyle(
    fontFamily: 'Asap',
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.12,
    letterSpacing: 0.06,
  );
}
