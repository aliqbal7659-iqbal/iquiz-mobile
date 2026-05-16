import 'package:flutter/material.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:iquiz/src/shared/presentation/widgets/list_item_widget.dart';
import 'package:iquiz/src/shared/presentation/widgets/search_input_widget.dart';
import 'package:provider/provider.dart';

class MateriPage extends StatefulWidget {
  const MateriPage({super.key});

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  final _searchController = TextEditingController();
  final _searchedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Materi")),
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          final isDark = themeProvider.themeMode == ThemeMode.dark;
          return Container(
            padding: EdgeInsets.all(10),
            color: isDark
                ? AppPalette.backgroundScaffoldDark
                : AppPalette.backgroundScaffold,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                children: [
                  /// Search Bar
                  SearchInputWidget(
                    searchController: _searchController,
                    searchedController: _searchedController,
                  ),

                  /// Items
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 100,
                    separatorBuilder: (context, index) =>
                        const SizedBox.square(dimension: 10),
                    itemBuilder: (context, index) {
                      return ListItemWidget(
                        title: "Test ${index + 1}",
                        subtitle: "${index + 20} Lorem",
                        onPressed: () {
                          //
                        },
                      );
                    },
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
