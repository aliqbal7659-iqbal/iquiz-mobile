import 'package:flutter/material.dart';
import 'package:iquiz/src/core/themes/app_font.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final bool isExpanded;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  const ButtonWidget({
    super.key,
    this.onPressed,
    required this.label,
    this.isExpanded = false,
    this.style,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return isExpanded ? Expanded(child: _buildButton()) : _buildButton();
  }

  OutlinedButton _buildButton() {
    return OutlinedButton(
      style: style,
      onPressed: onPressed,
      child: Text(
        label,
        style:
            textStyle ??
            AppFont.interMediumBold.copyWith(color: AppPalette.backgroundWhite),
      ),
    );
  }
}
