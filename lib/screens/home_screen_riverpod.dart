import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Dua baris di bawah ini wajib menggunakan '../' karena posisi berkasmu ada di dalam folder views!
import '../models/mata_kuliah.dart';
import '../providers/course_notifier.dart';


class HomeScreenRiverpod extends ConsumerWidget {
  const HomeScreenRiverpod({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final daftar = ref.watch(courseProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('CampusConnect (Riverpod)')),
      body: ListView.builder(
        itemCount: daftar.length,
        itemBuilder: (context, i) => Card(

          child: ListTile(
            title: Text(daftar[i].nama),
            subtitle: Text('${daftar[i].sks} SKS • ${daftar[i].dosen}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => ref.read(courseProvider.notifier).hapusMataKuliah(i),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(courseProvider.notifier).tambahMataKuliah(
            MataKuliah('Mata Kuliah Baru', 2, 'Dosen Uji')),
        child: const Icon(Icons.add),
      ),
    );
  }
}