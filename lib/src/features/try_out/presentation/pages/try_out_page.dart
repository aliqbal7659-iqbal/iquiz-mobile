import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/features/try_out/presentation/blocs/try_out/try_out_bloc.dart';
import 'package:iquiz/src/shared/domain/helper/show_toast.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:iquiz/src/shared/presentation/widgets/list_item_widget.dart';
import 'package:iquiz/src/shared/presentation/widgets/search_input_widget.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class TryOutPage extends StatefulWidget {
  const TryOutPage({super.key});

  @override
  State<TryOutPage> createState() => _TryOutPageState();
}

class _TryOutPageState extends State<TryOutPage> {
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
      appBar: AppBar(centerTitle: true, title: Text("Try Out")),
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
                  BlocConsumer<TryOutBloc, TryOutState>(
                    listener: (context, state) {
                      if (state is TryOutFailure) {
                        ShowToastHelper(
                          context: context,
                          message: state.message,
                          type: ToastificationType.error,
                        ).execute();
                      }
                    },
                    builder: (context, state) {
                      if (state is TryOutInProgress) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is TryOutSuccess) {
                        final data = state.data;
                        if (data.isEmpty) {
                          return Center(child: Text("Try-out Tidak Ditemukan"));
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
                              subtitle: "${data[index].questionTotal} Soal",
                              // onPressed: () => NavigateToModul(
                              //   context,
                              //   modulJsonName: data[index].modulName ?? "",
                              //   label: data[index].name ?? "-",
                              // ).execute(),
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
    BlocProvider.of<TryOutBloc>(context, listen: false).add(TryOutDataLoaded());
  }

  void _searchData(String value) {
    BlocProvider.of<TryOutBloc>(
      context,
      listen: false,
    ).add(TryOutDataSearched(keyword: value));
  }
}
