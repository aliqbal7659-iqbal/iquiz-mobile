import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MenuIconWidget extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback? onPressed;
  const MenuIconWidget({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isDark = themeProvider.themeMode == ThemeMode.dark;
        return InkWell(
          onTap: onPressed,
          child: Column(
            spacing: 4,
            children: [
              SvgPicture.asset(
                icon,
                width: 25,
                height: 25,
                colorFilter: ColorFilter.mode(
                  isDark ? AppPalette.textPrimaryDark : AppPalette.textPrimary,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        );
      },
    );
  }
}
