import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iquiz/src/core/themes/app_font.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/features/auth/domain/helper/navigate_to_login.dart';
import 'package:iquiz/src/features/auth/domain/utils/submit_login.dart';
import 'package:iquiz/src/shared/domain/utils/validate_email.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:iquiz/src/shared/presentation/widgets/button_widget.dart';
import 'package:iquiz/src/shared/presentation/widgets/iquiz_title_widget.dart';
import 'package:iquiz/src/shared/presentation/widgets/text_input_widget.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
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
                    "Daftar",
                    style: AppFont.interTitleBold.copyWith(
                      color: themeProvider.themeMode == ThemeMode.dark
                          ? AppPalette.textPrimaryDark
                          : AppPalette.textPrimary,
                    ),
                  ),
                  const SizedBox.square(dimension: 24),

                  /// Text input email
                  TextInputWidget(
                    hint: "nama lengkap",
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Nama lengkap tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  const SizedBox.square(dimension: 16),

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
                  Row(
                    children: [
                      ButtonWidget(
                        label: "Daftar",
                        isExpanded: true,
                        // onPressed: () =>
                        //     SubmitLoginUtils(formKey: formKey).execute(),
                      ),
                    ],
                  ),
                  const SizedBox.square(dimension: 16),

                  /// tombol daftar
                  Text.rich(
                    TextSpan(
                      text: "Sudah memiliki akun? ",
                      style: AppFont.interMediumRegular.copyWith(
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? AppPalette.textPrimaryDark
                            : AppPalette.textPrimary,
                      ),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: AppFont.interMediumBold.copyWith(
                            color: AppPalette.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              NavigateToLoginHelper(context).execute();
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
