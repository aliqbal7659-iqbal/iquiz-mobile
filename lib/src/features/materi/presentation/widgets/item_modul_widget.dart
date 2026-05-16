import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iquiz/src/core/themes/app_asset.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/features/materi/domain/entities/modul.dart';
import 'package:iquiz/src/features/materi/domain/helpers/navigate_to_detail_modul.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ItemModulWidget extends StatelessWidget {
  final Modul item;
  const ItemModulWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isDark = themeProvider.themeMode == ThemeMode.dark;
        return InkWell(
          onTap: () => NavigateToDetailModul(context, data: item).execute(),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDark
                  ? AppPalette.backgroundDark
                  : AppPalette.backgroundWhite,
              border: Border.all(
                color: isDark ? AppPalette.borderDark : AppPalette.border,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    item.name ?? "-",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 17),
                  ),
                ),
                SvgPicture.asset(
                  AppAsset.icPlay,
                  width: 24,
                  height: 24,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    isDark
                        ? AppPalette.textPrimaryDark
                        : AppPalette.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
