import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iquiz/src/core/common/logger.dart';
import 'package:iquiz/src/core/themes/app_font.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/features/auth/domain/utils/submit_login.dart';
import 'package:iquiz/src/features/auth/domain/helper/navigate_to_register.dart';
import 'package:iquiz/src/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:iquiz/src/features/auth/presentation/blocs/auth_check/auth_check_bloc.dart';
import 'package:iquiz/src/shared/domain/helper/show_toast.dart';
import 'package:iquiz/src/shared/domain/utils/validate_email.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:iquiz/src/shared/presentation/widgets/button_widget.dart';
import 'package:iquiz/src/shared/presentation/widgets/iquiz_title_widget.dart';
import 'package:iquiz/src/shared/presentation/widgets/text_input_widget.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return Container(
            margin: EdgeInsets.only(top: kToolbarHeight),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              children: [
                IquizTitleWidget(textStyle: AppFont.interLargeRegular),
                _buildContent(themeProvider),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(ThemeProvider themeProvider) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Masuk",
                    style: AppFont.interTitleBold.copyWith(
                      color: themeProvider.themeMode == ThemeMode.dark
                          ? AppPalette.textPrimaryDark
                          : AppPalette.textPrimary,
                    ),
                  ),
                  const SizedBox.square(dimension: 24),

                  /// Text input email
                  TextInputWidget(
                    hint: "email@domain.com",
                    controller: emailController,
                    validator: (value) => ValidateEmail.validate(value),
                  ),
                  const SizedBox.square(dimension: 16),

                  /// text input password
                  TextInputWidget(
                    hint: "password",
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password tidak boleh kosong";
                      } else if (value.length < 8) {
                        return "Password minimal 8 karakter";
                      }
                      return null;
                    },
                  ),
                  const SizedBox.square(dimension: 16),

                  /// tombol masuk
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      final isCurrent =
                          ModalRoute.of(context)?.isCurrent ?? false;
                      if (isCurrent) {
                        if (state is AuthSuccess) {
                          ShowToastHelper(
                            context: context,
                            message: state.message,
                            type: ToastificationType.success,
                          ).execute();
                          logger.i(state.message);
                          BlocProvider.of<AuthCheckBloc>(
                            context,
                            listen: false,
                          ).add(AuthChecked());
                        } else if (state is AuthFailure) {
                          ShowToastHelper(
                            context: context,
                            message: state.message,
                            type: ToastificationType.error,
                          ).execute();
                          logger.e(state.message);
                        }
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthInProgress) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return Row(
                        children: [
                          ButtonWidget(
                            label: "Masuk",
                            isExpanded: true,
                            onPressed: () => SubmitLoginUtils(
                              context,
                              formKey: formKey,
                              emailController: emailController,
                              passwordController: passwordController,
                            ).execute(),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox.square(dimension: 16),

                  /// tombol daftar
                  Text.rich(
                    TextSpan(
                      text: "Belum memiliki akun? ",
                      style: AppFont.interMediumRegular.copyWith(
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? AppPalette.textPrimaryDark
                            : AppPalette.textPrimary,
                      ),
                      children: [
                        TextSpan(
                          text: "Daftar",
                          style: AppFont.interMediumBold.copyWith(
                            color: AppPalette.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              NavigateToRegisterHelper(context).execute();
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
