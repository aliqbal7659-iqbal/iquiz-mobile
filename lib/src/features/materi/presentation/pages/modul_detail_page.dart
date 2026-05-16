import 'package:flutter/material.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/features/materi/domain/entities/modul.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ModulDetailPage extends StatefulWidget {
  final Modul data;
  const ModulDetailPage({super.key, required this.data});

  @override
  State<ModulDetailPage> createState() => _ModulDetailPageState();
}

class _ModulDetailPageState extends State<ModulDetailPage> {
  late YoutubePlayerController ytController;
  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(widget.data.courseLink ?? "");
    ytController = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: true,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    ytController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.data.name ?? "Detail Modul",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(controller: ytController),

        builder: (context, player) {
          return Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              final isDark = themeProvider.themeMode == ThemeMode.dark;
              return Container(
                padding: EdgeInsets.all(10),
                color: isDark
                    ? AppPalette.backgroundDark
                    : AppPalette.backgroundWhite,
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      /// Youtube Player
                      player,

                      /// Title
                      Text(
                        widget.data.name ?? "-",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),

                      /// Description
                      Text(
                        widget.data.description ?? "-",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
