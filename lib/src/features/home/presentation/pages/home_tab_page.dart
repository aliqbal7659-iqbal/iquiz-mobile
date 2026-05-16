import 'package:flutter/material.dart';
import 'package:iquiz/src/core/themes/app_asset.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/features/auth/domain/entities/user.dart';
import 'package:iquiz/src/features/home/domain/helpers/navigate_to_materi.dart';
import 'package:iquiz/src/features/home/domain/helpers/navigate_to_tryout.dart';
import 'package:iquiz/src/features/home/presentation/widgets/menu_icon_widget.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeTabPage extends StatefulWidget {
  final ValueNotifier<User?> userNotifier;
  const HomeTabPage({super.key, required this.userNotifier});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Welcome Aboard
            ValueListenableBuilder(
              valueListenable: widget.userNotifier,
              builder: (context, user, child) {
                return Text(
                  "Selamat Datang,\n${user?.fullName ?? "-"}",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
            ),

            /// Image Banner
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 171,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            /// Menu
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                final isDark = themeProvider.themeMode == ThemeMode.dark;

                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: !isDark
                        ? AppPalette.backgroundWhite
                        : AppPalette.secondary,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isDark
                          ? AppPalette.primary
                          : AppPalette.textSecondary,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    spacing: 40,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MenuIconWidget(
                        icon: AppAsset.icBook,
                        label: "Materi",
                        onPressed: () =>
                            NavigateToMateriHelper(context).execute(),
                      ),
                      MenuIconWidget(
                        icon: AppAsset.icGoal,
                        label: "Try-Out",
                        onPressed: () =>
                            NavigateToTryoutHelper(context).execute(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
