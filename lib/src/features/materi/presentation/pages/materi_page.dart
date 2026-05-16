import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/features/materi/domain/helpers/navigate_to_modul.dart';
import 'package:iquiz/src/features/materi/presentation/blocs/materi/materi_bloc.dart';
import 'package:iquiz/src/shared/domain/helper/show_toast.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:iquiz/src/shared/presentation/widgets/list_item_widget.dart';
import 'package:iquiz/src/shared/presentation/widgets/search_input_widget.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class MateriPage extends StatefulWidget {
  const MateriPage({super.key});

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  final _searchController = TextEditingController();
  final _searchedController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getData();
    });
  }

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
                    onReset: () {
                      _getData();
                    },
                    onSubmitted: (value) {
                      if (value != null && value.isNotEmpty) {
                        _searchData(value);
                      } else {
                        ShowToastHelper(
                          context: context,
                          message: "Keyword anda kosong",
                          type: ToastificationType.info,
                        ).execute();
                      }
                    },
                  ),

                  /// Items
                  BlocConsumer<MateriBloc, MateriState>(
                    listener: (context, state) {
                      if (state is MateriFailure) {
                        ShowToastHelper(
                          context: context,
                          message: state.message,
                          type: ToastificationType.error,
                        ).execute();
                      }
                    },
                    builder: (context, state) {
                      if (state is MateriInProgress) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is MateriSuccess) {
                        final data = state.data;
                        if (data.isEmpty) {
                          return Center(child: Text("Materi Tidak Ditemukan"));
                        }

                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox.square(dimension: 10),
                          itemBuilder: (context, index) {
                            return ListItemWidget(
                              title: data[index].name ?? "-",
                              subtitle: "${data[index].totalModul} Modul",
                              onPressed: () => NavigateToModul(
                                context,
                                modulJsonName: data[index].modulName ?? "",
                                label: data[index].name ?? "-",
                              ).execute(),
                            );
                          },
                        );
                      }
                      return SizedBox.shrink();
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

  void _getData() {
    BlocProvider.of<MateriBloc>(context, listen: false).add(MateriDataLoaded());
  }

  void _searchData(String value) {
    BlocProvider.of<MateriBloc>(
      context,
      listen: false,
    ).add(MateriDataSearched(searched: value));
  }
}
