import 'package:flutter/material.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class QuestionNavButtonWidget extends StatelessWidget {
  final String? number;
  final Widget? child;
  final bool selected;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  const QuestionNavButtonWidget({
    super.key,
    this.number,
    this.child,
    this.selected = false,
    this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          final isDark = themeProvider.themeMode == ThemeMode.dark;
          return Container(
            width: width ?? 40,
            height: height ?? 40,
            decoration: BoxDecoration(
              color: onPressed == null
                  ? Colors.grey
                  : (selected
                        ? AppPalette.secondary
                        : (isDark
                              ? AppPalette.backgroundDark
                              : AppPalette.backgroundWhite)),
              border: Border.all(
                color: isDark
                    ? AppPalette.borderDark
                    : AppPalette.borderSecondary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child:
                  child ??
                  Text(
                    number ?? "-",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: onPressed == null
                          ? const Color.fromARGB(255, 236, 236, 236)
                          : (selected
                                ? AppPalette.backgroundWhite
                                : (isDark
                                      ? AppPalette.textPrimaryDark
                                      : AppPalette.textPrimary)),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            ),
          );
        },
      ),
    );
  }
}
