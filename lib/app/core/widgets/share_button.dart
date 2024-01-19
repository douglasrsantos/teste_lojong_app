import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final Function()? onPressed;
  final TextStyle? style;
  final Color? iconColor;
  final Color? backgroundColor;

  const ShareButton({
    super.key,
    this.onPressed,
    this.style,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        Icons.share,
        size: 16,
        color: iconColor,
      ),
      label: Text(
        'Compartilhar',
        style: style,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
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
    );
  }
}
