import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/mata_kuliah.dart';
import 'providers/course_notifier.dart';
import 'screens/home_screen_riverpod.dart';

void main() {
  runApp(
    // Kunci utama Riverpod: Wajib dibungkus ProviderScope
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CampusConnect Riverpod',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // PASTIKAN BARIS INI MEMANGGIL CourseRiverpodPage:
      home: const HomeScreenRiverpod(),
    );
  }
}


// Menggunakan ConsumerWidget agar bisa berinteraksi dengan Riverpod
class CourseRiverpodPage extends ConsumerWidget {
  const CourseRiverpodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Membaca daftar mata kuliah dari provider secara real-time
    final daftarMataKuliah = ref.watch(courseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CampusConnect (Riverpod)'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: ListView.builder(
        itemCount: daftarMataKuliah.length,
        itemBuilder: (context, index) {
          final mk = daftarMataKuliah[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text('${mk.sks} SKS'),
            ),
            title: Text(mk.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Dosen: ${mk.dosen}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi simulasi menambah mata kuliah baru seperti instruksi modul
          ref.read(courseProvider.notifier).tambahMataKuliah(
            MataKuliah('Praktikum Pemrograman Mobile', 1, 'Tim Dosen'),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
