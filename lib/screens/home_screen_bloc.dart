import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/course_bloc.dart';
import '../bloc/course_event.dart';
import '../bloc/course_state.dart';
import '../models/mata_kuliah.dart';

class HomeScreenBloc extends StatelessWidget {
  const HomeScreenBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CampusConnect (BLoC)'),
        backgroundColor: Colors.orange.shade100, // Membedakan warna dengan versi Riverpod
      ),
      // 1. Menggunakan BlocBuilder untuk membaca state secara real-time
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          // Jika data sedang dimuat (Loading)
          if (state is CourseLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          // Jika data berhasil dimuat dan tersedia (Loaded)
          if (state is CourseLoadedState) {
            final daftar = state.daftarMataKuliah;

            return ListView.builder(
              itemCount: daftar.length,
              itemBuilder: (context, i) => Card(
                child: ListTile(
                  title: Text(daftar[i].nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${daftar[i].sks} SKS • ${daftar[i].dosen}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    // 2. Mengirim Event Hapus melalui context.read().add()
                    onPressed: () {
                      context.read<CourseBloc>().add(HapusMataKuliahEvent(i));
                    },
                  ),
                ),
              ),
            );
          }

          // Kondisi fallback jika terjadi status yang tidak dikenal
          return const Center(child: Text('Gagal memuat data mata kuliah.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        // 3. Mengirim Event Tambah melalui context.read().add()
        onPressed: () {
          context.read<CourseBloc>().add(
            TambahMataKuliahEvent(
              MataKuliah('Mata Kuliah Baru (BLoC)', 3, 'Dosen Uji BLoC'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
