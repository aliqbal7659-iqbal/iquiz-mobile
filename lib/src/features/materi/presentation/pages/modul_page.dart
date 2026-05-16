import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/features/materi/presentation/blocs/modul/modul_bloc.dart';
import 'package:iquiz/src/features/materi/presentation/widgets/item_modul_widget.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ModulPage extends StatefulWidget {
  /// Berisi nama json modul yang tersimpan di lokal
  final String modulJsonName;

  /// Berisi nama dari materi yang dibuka
  final String label;
  const ModulPage({
    super.key,
    required this.modulJsonName,
    required this.label,
  });

  @override
  State<ModulPage> createState() => _ModulPageState();
}

class _ModulPageState extends State<ModulPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ModulBloc>(
        context,
        listen: false,
      ).add(ModulDataLoaded(fileName: widget.modulJsonName));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.label, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
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
            child: BlocConsumer<ModulBloc, ModulState>(
              listener: (context, state) {
                //
              },
              builder: (context, state) {
                if (state is ModulInProgress) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ModulSuccess) {
                  final data = state.data;
                  if (data.isEmpty) {
                    return Center(child: Text("Modul Tidak Ditemukan"));
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: data.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox.square(dimension: 10),
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return ItemModulWidget(item: item);
                    },
                  );
                }
                return SizedBox.shrink();
              },
            ),
          );
        },
      ),
    );
  }
}
