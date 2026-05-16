import 'package:bloc/bloc.dart';
import 'package:iquiz/src/features/try_out/domain/entities/tryout_question.dart';
import 'package:iquiz/src/features/try_out/domain/usecases/get_try_out_questions.dart';

part 'try_out_question_event.dart';
part 'try_out_question_state.dart';

class TryOutQuestionBloc
    extends Bloc<TryOutQuestionEvent, TryOutQuestionState> {
  final GetTryOutQuestions getTryOutQuestions;
  TryOutQuestionBloc({required this.getTryOutQuestions})
    : super(TryOutQuestionInitial()) {
    on<TryOutQuestionLoaded>((event, emit) async {
      emit(TryOutQuestionInProgress());
      final resp = await getTryOutQuestions.execute(fileName: event.fileName);

      resp.fold(
        (l) => emit(TryOutQuestionFailure(message: l.message)),
        (r) => emit(TryOutQuestionSuccess(data: r)),
      );
    });
  }
}
