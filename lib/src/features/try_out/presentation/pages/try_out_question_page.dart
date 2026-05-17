import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iquiz/src/core/common/logger.dart';
import 'package:iquiz/src/core/themes/app_asset.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/features/try_out/domain/entities/tryout_answer.dart';
import 'package:iquiz/src/features/try_out/domain/entities/tryout_question.dart';
import 'package:iquiz/src/features/try_out/domain/enums/option_answer.dart';
import 'package:iquiz/src/features/try_out/presentation/blocs/try_out_question/try_out_question_bloc.dart';
import 'package:iquiz/src/features/try_out/presentation/pages/question_nav_button_widget.dart';
import 'package:iquiz/src/shared/domain/helper/show_toast.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class TryOutQuestionPage extends StatefulWidget {
  /// Berisi Nama Try-Out / Judul Try-out
  final String label;

  /// Berisi Nama File JSON Soal
  final String fileName;

  const TryOutQuestionPage({
    super.key,
    required this.label,
    required this.fileName,
  });

  @override
  State<TryOutQuestionPage> createState() => _TryOutQuestionPageState();
}

class _TryOutQuestionPageState extends State<TryOutQuestionPage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late ScrollController _numberScrollController;
  ValueNotifier<int> currentPageNotifier = ValueNotifier(0);
  ValueNotifier<List<TryoutQuestion>> dataNotifier = ValueNotifier([]);
  ValueNotifier<List<TryoutAnswer>> tryOutAnswerNotifier = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPageNotifier.value);
    _numberScrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<TryOutQuestionBloc>(
        context,
        listen: false,
      ).add(TryOutQuestionLoaded(fileName: widget.fileName));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    currentPageNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.label, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      body: SafeArea(
        child: BlocConsumer<TryOutQuestionBloc, TryOutQuestionState>(
          listener: (context, state) {
            if (state is TryOutQuestionSuccess) {
              dataNotifier.value = state.data;
              logger.d(state.data);
            } else if (state is TryOutQuestionFailure) {
              ShowToastHelper(
                context: context,
                message: state.message,
                type: ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            if (state is TryOutQuestionInProgress) {
              return Center(child: CircularProgressIndicator());
            } else if (state is TryOutQuestionSuccess) {
              return _buildContent();
            } else if (state is TryOutQuestionFailure) {
              return Center(child: Text("Soal gagal dimuat"));
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isDark = themeProvider.themeMode == ThemeMode.dark;
        return ValueListenableBuilder(
          valueListenable: currentPageNotifier,
          builder: (context, currentPage, child) {
            return SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                children: [
                  /// Question Total
                  _buildQuestionTotal(context, currentPage),

                  /// Navigator
                  _buildNavigator(context, isDark, currentPage),

                  /// Soal
                  _buildQuestion(isDark),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildQuestionTotal(BuildContext context, int currentPage) {
    return ValueListenableBuilder(
      valueListenable: dataNotifier,
      builder: (context, data, child) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          color: AppPalette.secondary,
          padding: EdgeInsets.all(10),
          child: Text("Soal ke-${currentPage + 1} dari ${data.length} soal"),
        );
      },
    );
  }

  Widget _buildAnswer(BuildContext context, bool isDark, TryoutQuestion item) {
    return ValueListenableBuilder(
      valueListenable: tryOutAnswerNotifier,
      builder: (context, answeredData, child) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          color: isDark
              ? AppPalette.backgroundScaffoldDark
              : AppPalette.backgroundScaffold,
          padding: EdgeInsets.all(10),
          child: Row(
            spacing: 38,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuestionNavButtonWidget(
                number: "A",
                width: 50,
                height: 50,
                selected: OptionAnswer.A == getAnswer(item),
                onPressed: () =>
                    _answer(item: item, userAnswer: OptionAnswer.A),
              ),
              QuestionNavButtonWidget(
                number: "B",
                width: 50,
                height: 50,
                selected: OptionAnswer.B == getAnswer(item),
                onPressed: () =>
                    _answer(item: item, userAnswer: OptionAnswer.B),
              ),
              QuestionNavButtonWidget(
                number: "C",
                width: 50,
                height: 50,
                selected: OptionAnswer.C == getAnswer(item),
                onPressed: () =>
                    _answer(item: item, userAnswer: OptionAnswer.C),
              ),
              QuestionNavButtonWidget(
                number: "D",
                width: 50,
                height: 50,
                selected: OptionAnswer.D == getAnswer(item),
                onPressed: () =>
                    _answer(item: item, userAnswer: OptionAnswer.D),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQuestion(bool isDark) {
    return ValueListenableBuilder(
      valueListenable: dataNotifier,
      builder: (context, data, child) {
        return Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                color: isDark
                    ? AppPalette.backgroundDark
                    : AppPalette.backgroundWhite,
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return Column(
                      children: [
                        Expanded(child: Html(data: item.question)),
                        _buildAnswer(context, isDark, item),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildNavigator(BuildContext context, bool isDark, int currentPage) {
    return ValueListenableBuilder(
      valueListenable: dataNotifier,
      builder: (context, data, child) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          color: isDark
              ? AppPalette.backgroundScaffoldDark
              : AppPalette.backgroundScaffold,
          padding: EdgeInsets.all(10),
          child: Row(
            spacing: 4,
            children: [
              QuestionNavButtonWidget(
                onPressed: currentPage == 0
                    ? null
                    : () => _navigateToPage(currentPage - 1),
                child: Transform.flip(
                  flipX: true,
                  child: SvgPicture.asset(
                    AppAsset.icChevronRight,
                    width: 25,
                    height: 25,
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(
                      isDark
                          ? AppPalette.textPrimaryDark
                          : AppPalette.textPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SizedBox(
                      width: constraints.maxWidth,
                      height: 40,
                      child: ListView.separated(
                        controller: _numberScrollController,
                        shrinkWrap: true,
                        itemCount: data.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            SizedBox.square(dimension: 4),
                        itemBuilder: (BuildContext context, int index) {
                          return QuestionNavButtonWidget(
                            number: "${index + 1}",
                            selected: index == currentPage,
                            onPressed: () => _navigateToPage(index),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              QuestionNavButtonWidget(
                onPressed: (currentPage + 1) == data.length
                    ? null
                    : () => _navigateToPage(currentPage + 1),
                child: SvgPicture.asset(
                  AppAsset.icChevronRight,
                  width: 25,
                  height: 25,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    isDark
                        ? AppPalette.textPrimaryDark
                        : AppPalette.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  OptionAnswer getAnswer(TryoutQuestion item) {
    final currentAnswers = tryOutAnswerNotifier.value;
    final questionIdToFind = item.id;

    final exists = currentAnswers.any((a) => a.questionId == questionIdToFind);
    if (exists) {
      return currentAnswers
          .where((a) => a.questionId == questionIdToFind)
          .first
          .userAnswer;
    }
    return OptionAnswer.none;
  }

  void _answer({
    required TryoutQuestion item,
    required OptionAnswer userAnswer,
  }) {
    final currentAnswers = tryOutAnswerNotifier.value;
    final questionIdToFind = item.id;

    final exists = currentAnswers.any((a) => a.questionId == questionIdToFind);

    if (exists) {
      tryOutAnswerNotifier.value = currentAnswers.map((answer) {
        if (answer.questionId == questionIdToFind) {
          return answer.copyWith(userAnswer: userAnswer);
        }
        return answer;
      }).toList();
      tryOutAnswerNotifier.value = tryOutAnswerNotifier.value;
    } else {
      final newAnswer = TryoutAnswer(
        questionId: item.id ?? 0,
        questions: item.question ?? "-",
        discussion: item.discussion ?? "-",
        isCorrect: userAnswer == item.answer,
        correctAnswer: item.answer ?? OptionAnswer.none,
        userAnswer: userAnswer,
      );

      tryOutAnswerNotifier.value = [...currentAnswers, newAnswer];
    }
  }

  void _navigateToPage(int index) {
    _scrollToIndex(index);
    currentPageNotifier.value = index;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInCirc,
    );
  }

  void _scrollToIndex(int index) {
    if (!_numberScrollController.hasClients) return;

    double targetOffset = (index * 30);

    _numberScrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
