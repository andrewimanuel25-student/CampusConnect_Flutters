import '../models/mata_kuliah.dart';

abstract class CourseState {}

// Kondisi saat data sedang dimuat
class CourseLoadingState extends CourseState {}

// Kondisi saat data berhasil dimuat dan membawa daftar mata kuliahnya
class CourseLoadedState extends CourseState {
    final List<MataKuliah> daftarMataKuliah;
    CourseLoadedState(this.daftarMataKuliah);
}
