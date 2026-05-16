import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iquiz/src/core/themes/app_asset.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ListItemWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onPressed;
  const ListItemWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isDark = themeProvider.themeMode == ThemeMode.dark;
        return ListTileWidget(
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle ?? "-") : null,
          trailing: SvgPicture.asset(
            AppAsset.icChevronRight,
            width: 24,
            height: 24,

            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              isDark ? AppPalette.textPrimaryDark : AppPalette.textPrimary,
              BlendMode.srcIn,
            ),
          ),
          onPressed: onPressed,
        );
      },
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onPressed;
  const ListTileWidget({
    super.key,
    this.title,
    this.subtitle,
    this.trailing,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isDark = themeProvider.themeMode == ThemeMode.dark;
        return Material(
          type: MaterialType.card,
          color: isDark
              ? AppPalette.backgroundDark
              : AppPalette.backgroundWhite,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isDark ? AppPalette.borderDark : AppPalette.border,
            ),
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            title: title,
            subtitle: subtitle,
            trailing: trailing,
            visualDensity: VisualDensity.comfortable,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10 / 4,
              horizontal: 10,
            ),
            splashColor: AppPalette.secondary,
            onTap: onPressed,
          ),
        );
      },
    );
  }
}
