import 'package:bloc/bloc.dart';
import 'package:iquiz/src/features/try_out/domain/entities/tryout.dart';
import 'package:iquiz/src/features/try_out/domain/usecases/get_try_out.dart';
import 'package:iquiz/src/features/try_out/domain/usecases/search_try_out.dart';

part 'try_out_event.dart';
part 'try_out_state.dart';

class TryOutBloc extends Bloc<TryOutEvent, TryOutState> {
  final GetTryOut getTryOut;
  final SearchTryOut searchTryOut;
  TryOutBloc({required this.getTryOut, required this.searchTryOut})
    : super(TryOutInitial()) {
    on<TryOutDataLoaded>((event, emit) async {
      emit(TryOutInProgress());
      final resp = await getTryOut.execute();
      resp.fold(
        (l) => emit(TryOutFailure(message: l.message)),
        (r) => emit(TryOutSuccess(data: r)),
      );
    });

    on<TryOutDataSearched>((event, emit) async {
      emit(TryOutInProgress());
      final resp = await searchTryOut.execute(keyword: event.keyword);
      resp.fold(
        (l) => emit(TryOutFailure(message: l.message)),
        (r) => emit(TryOutSuccess(data: r)),
      );
    });
  }
}
