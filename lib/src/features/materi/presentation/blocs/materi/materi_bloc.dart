import 'package:bloc/bloc.dart';
import 'package:iquiz/src/features/materi/domain/entities/materi.dart';
import 'package:iquiz/src/features/materi/domain/usecases/get_materi.dart';
import 'package:iquiz/src/features/materi/domain/usecases/search_materi.dart';

part 'materi_event.dart';
part 'materi_state.dart';

class MateriBloc extends Bloc<MateriEvent, MateriState> {
  final GetMateri getMateri;
  final SearchMateri searchMateri;
  MateriBloc({required this.getMateri, required this.searchMateri})
    : super(MateriInitial()) {
    /// Ambil Data Materi
    on<MateriDataLoaded>((event, emit) async {
      emit(MateriInProgress());
      final resp = await getMateri.execute();
      resp.fold(
        (l) => emit(MateriFailure(message: l.message)),
        (r) => emit(MateriSuccess(data: r)),
      );
    });

    /// Cari Data Materi
    on<MateriDataSearched>((event, emit) async {
      emit(MateriInProgress());
      final resp = await searchMateri.execute(search: event.searched);
      resp.fold(
        (l) => emit(MateriFailure(message: l.message)),
        (r) => emit(MateriSuccess(data: r)),
      );
    });
  }
}
