import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iquiz/src/core/themes/app_asset.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/shared/presentation/widgets/text_input_widget.dart';

class SearchInputWidget extends StatelessWidget {
  final TextEditingController searchController;
  final TextEditingController searchedController;
  final void Function(String? value)? onSubmitted;

  const SearchInputWidget({
    super.key,
    required this.searchController,
    required this.searchedController,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: searchedController,
      builder: (context, value, child) {
        return TextInputWidget(
          hint: "Cari...",
          prefixIcon: SvgPicture.asset(
            AppAsset.icSearch,
            width: 24,
            height: 24,
            fit: BoxFit.scaleDown,
          ),
          controller: searchController,
          suffixIcon: searchedController.text.trim().isEmpty
              ? null
              : InkWell(
                  onTap: () => onResetSearch(),
                  child: Icon(Icons.close, color: AppPalette.textSecondary),
                ),
          onFieldSubmitted: (value) => onSearchSubmitted(value),
        );
      },
    );
  }

  void onResetSearch() {
    searchedController.clear();
    searchController.clear();
  }

  void onSearchSubmitted(String value) {
    searchedController.text = value;
    if (onSubmitted != null) {
      onSubmitted!(value);
    }
  }
}
