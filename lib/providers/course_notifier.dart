import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/mata_kuliah.dart';
import '../data/dummy_data.dart';

// 1. Kelas Notifier yang mengatur aksi menambah data
class CourseNotifier extends StateNotifier<List<MataKuliah>> {
  CourseNotifier() : super(daftarMataKuliahDummy);

  // Fungsi untuk menambah mata kuliah baru ke dalam daftar
  void tambahMataKuliah(MataKuliah mataKuliah) {
    state = [...state, mataKuliah];
  }

  // TAMBAHKAN FUNGSI HAPUS INI:
  void hapusMataKuliah(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i]
    ];
  }
}

// 2. Provider global agar data ini bisa dibaca oleh halaman UI manapun
final courseProvider = StateNotifierProvider<CourseNotifier, List<MataKuliah>>((ref) {
  return CourseNotifier();
});
