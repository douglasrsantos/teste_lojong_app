import 'package:flutter/material.dart';
import 'package:teste_lojong/app/core/ui/app_fonts.dart';
import 'package:teste_lojong/app/core/widgets/recharge_button.dart';

class ErrorDataOrNetworkWidget extends StatelessWidget {
  final String content;
  final Function()? onPressed;

  const ErrorDataOrNetworkWidget({
    super.key,
    required this.content,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'OPS!',
            style: AppFonts.titleErrorPage,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              content,
              style: AppFonts.contentErrorPage,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          RechargeButton(
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
