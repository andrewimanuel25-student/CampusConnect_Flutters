import '../models/mata_kuliah.dart';

abstract class CourseEvent {}

// Aksi 1: Memuat data awal mata kuliah
class LoadCoursesEvent extends CourseEvent {}

// Aksi 2: Menambah mata kuliah baru
class TambahMataKuliahEvent extends CourseEvent {
  final MataKuliah mataKuliah;
  TambahMataKuliahEvent(this.mataKuliah);
}

// Aksi 3: Menghapus mata kuliah berdasarkan posisinya
class HapusMataKuliahEvent extends CourseEvent {
  final int index;
  HapusMataKuliahEvent(this.index);
}
