import 'package:flutter/material.dart';
import 'package:teste_lojong/app/core/ui/app_colors.dart';

class AppGradients {
  static LinearGradient blueGradient = LinearGradient(
    colors: [AppColors.blueGradientInit, AppColors.blueGradientFinal],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient beigeGradient = LinearGradient(
    colors: [AppColors.beigeGradientInit, AppColors.beigeGradientFinal],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient salmonGradient = LinearGradient(
    colors: [AppColors.salmonGradientInit, AppColors.salmonGradientFinal],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
