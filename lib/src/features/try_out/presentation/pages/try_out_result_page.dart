import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/features/try_out/domain/entities/tryout_answer.dart';
import 'package:iquiz/src/shared/presentation/widgets/button_widget.dart';

class TryOutResultPage extends StatefulWidget {
  final List<TryoutAnswer> answeredQuestions;
  final num score;
  const TryOutResultPage({
    super.key,
    required this.answeredQuestions,
    required this.score,
  });

  @override
  State<TryOutResultPage> createState() => _TryOutResultPageState();
}

class _TryOutResultPageState extends State<TryOutResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Hasil Try-out",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              Container(
                padding: EdgeInsetsGeometry.all(10),
                decoration: BoxDecoration(
                  color: AppPalette.secondary,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Skor Total",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontSize: 17,
                                color: AppPalette.backgroundWhite,
                              ),
                        ),
                        Text(
                          DateFormat('dd MMMM yyyy').format(DateTime.now()),
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontSize: 10,
                                color: AppPalette.backgroundWhite,
                              ),
                        ),
                      ],
                    ),
                    Text(
                      widget.score.toString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppPalette.backgroundWhite,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ButtonWidget(
                      label: "Keluar",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
