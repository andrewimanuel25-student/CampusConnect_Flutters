import 'package:flutter_bloc/flutter_bloc.dart';
import 'course_event.dart';
import 'course_state.dart';
import '../data/dummy_data.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseLoadingState()) {

    // Logika 1: Ketika diperintahkan memuat data
    on<LoadCoursesEvent>((event, emit) {
      emit(CourseLoadedState(List.from(daftarMataKuliahDummy)));
    });

    // Logika 2: Ketika ada aksi menambah data
    on<TambahMataKuliahEvent>((event, emit) {
      if (state is CourseLoadedState) {
        final currentList = (state as CourseLoadedState).daftarMataKuliah;
        // Gabungkan data lama dengan data baru yang dibawa oleh event
        emit(CourseLoadedState([...currentList, event.mataKuliah]));
      }
    });

    // Logika 3: Ketika ada aksi menghapus data
    on<HapusMataKuliahEvent>((event, emit) {
      if (state is CourseLoadedState) {
        final currentList = (state as CourseLoadedState).daftarMataKuliah;
        final updatedList = [
          for (int i = 0; i < currentList.length; i++)
            if (i != event.index) currentList[i]
        ];
        emit(CourseLoadedState(updatedList));
      }
    });
  }
}
