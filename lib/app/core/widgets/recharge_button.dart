import 'package:flutter/material.dart';
import 'package:teste_lojong/app/core/ui/app_colors.dart';
import 'package:teste_lojong/app/core/ui/app_fonts.dart';

class RechargeButton extends StatelessWidget {
  final Function()? onPressed;

  const RechargeButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.cardButtonColor,
        elevation: 0,
        minimumSize: Size(
          MediaQuery.of(context).size.width / 3,
          30,
        ),
        maximumSize: Size(
          MediaQuery.of(context).size.width / 2,
          30,
        ),
      ),
      child: Text(
        'Recarregar',
        style: AppFonts.cardTextButton,
      ),
    );
  }
}
