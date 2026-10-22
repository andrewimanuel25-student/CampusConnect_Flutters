# Laporan Analisis Perbandingan Performa Kode: Riverpod vs BLoC
**Proyek:** CampusConnect Flutter  
**Fitur:** Menampilkan, Menambah, dan Menghapus Data Mata Kuliah (Identik)

## 1. Pendekatan Riverpod
Pendekatan Riverpod jauh lebih ringkas karena menggabungkan status (*state*) dan fungsi aksi dalam satu berkas Notifier.

* **Jumlah Berkas:** 2 Berkas
    1. `lib/providers/course_notifier.dart` (~17 baris)
    2. `lib/views/home_screen_riverpod.dart` (~35 baris)
* **Total Baris Kode (LOC):** ~52 Baris : 30 menit

## 2. Pendekatan BLoC (Business Logic Component)
Pendekatan BLoC membutuhkan lebih banyak berkas (arsitektur Tiga Pilar) untuk memisahkan Event, State, dan Logika Pemroses secara ketat.

* **Jumlah Berkas:** 4 Berkas
    1. `lib/bloc/course_event.dart` (~16 baris)
    2. `lib/bloc/course_state.dart` (~12 baris)
    3. `lib/bloc/course_bloc.dart` (~33 baris)
    4. `lib/screens/home_screen_bloc.dart` (~57 baris)
* **Total Baris Kode (LOC):** ~118 Baris 30 menit

## 3. Kesimpulan Analisis
1. **Riverpod** terbukti unggul dari segi efisiensi penulisan kode karena memotong jalur deklarasi berkas hingga **50%** dan menghemat baris kode hingga lebih dari **2 kali lipat** dibandingkan BLoC untuk fitur yang sama.
2. **BLoC** memiliki struktur yang lebih *verbose* (panjang lebar), namun memberikan pemisahan logika yang sangat jelas dan terstruktur dengan baik untuk skala proyek tim besar.
