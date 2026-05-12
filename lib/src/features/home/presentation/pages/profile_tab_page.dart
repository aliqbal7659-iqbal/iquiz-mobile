import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iquiz/src/core/themes/app_font.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/features/auth/domain/entities/user.dart';
import 'package:iquiz/src/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:iquiz/src/features/auth/presentation/blocs/auth_check/auth_check_bloc.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:iquiz/src/shared/presentation/widgets/button_widget.dart';
import 'package:provider/provider.dart';

class ProfileTabPage extends StatefulWidget {
  final ValueNotifier<User?> userNotifier;
  const ProfileTabPage({super.key, required this.userNotifier});

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isDark = themeProvider.themeMode == ThemeMode.dark;

        return Container(
          color: isDark
              ? AppPalette.backgroundScaffoldDark
              : AppPalette.backgroundScaffold,
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserInfo(isDark),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      color: isDark
                          ? AppPalette.backgroundDark
                          : AppPalette.backgroundWhite,
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Settings
                          Text(
                            "Pengaturan",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          SwitchListTile(
                            activeThumbColor: AppPalette.backgroundWhite,
                            activeTrackColor: AppPalette.secondary,
                            value: themeProvider.themeMode == ThemeMode.dark,
                            title: Text("Mode Gelap"),
                            onChanged: (val) {
                              themeProvider.toggleTheme(val);
                            },
                          ),
                          const SizedBox.square(dimension: 24),

                          /// Button Logout
                          BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) {
                              final isCurrent =
                                  ModalRoute.of(context)?.isCurrent ?? false;
                              if (isCurrent) {
                                if (state is AuthLogOutSuccess) {
                                  BlocProvider.of<AuthCheckBloc>(
                                    context,
                                    listen: false,
                                  ).add(AuthChecked());
                                }
                              }
                            },
                            builder: (context, state) {
                              if (state is AuthInProgress) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return _buildButtonLogout(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Row _buildButtonLogout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonWidget(
            label: "Logout",
            style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
              backgroundColor: WidgetStatePropertyAll(AppPalette.redMain),
              side: WidgetStatePropertyAll(
                BorderSide(color: AppPalette.redMain),
              ),
            ),
            onPressed: () {
              BlocProvider.of<AuthBloc>(
                context,
                listen: false,
              ).add(AuthLoggedOut());
            },
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo(bool isDark) {
    return ValueListenableBuilder(
      valueListenable: widget.userNotifier,
      builder: (context, user, child) {
        return Container(
          padding: EdgeInsets.all(10),
          color: isDark
              ? AppPalette.backgroundDark
              : AppPalette.backgroundWhite,
          child: Row(
            spacing: 8,
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: CircleAvatar(child: Icon(Icons.person)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user?.fullName ?? "-",
                    style: AppFont.interMediumBold.copyWith(
                      color: isDark
                          ? AppPalette.textPrimaryDark
                          : AppPalette.textPrimary,
                    ),
                  ),
                  Text(
                    user?.email ?? "-",
                    style: AppFont.interMediumRegular.copyWith(
                      color: AppPalette.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
