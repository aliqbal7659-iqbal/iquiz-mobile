import 'package:bloc/bloc.dart';
import 'package:iquiz/src/features/materi/domain/entities/modul.dart';
import 'package:iquiz/src/features/materi/domain/usecases/get_modul.dart';

part 'modul_event.dart';
part 'modul_state.dart';

class ModulBloc extends Bloc<ModulEvent, ModulState> {
  final GetModul getModul;
  ModulBloc({required this.getModul}) : super(ModulInitial()) {
    on<ModulDataLoaded>((event, emit) async {
      emit(ModulInProgress());
      final resp = await getModul.execute(fileName: event.fileName);

      resp.fold(
        (l) => emit(ModulFailure(message: l.message)),
        (r) => emit(ModulSuccess(data: r)),
      );
    });
  }
}
