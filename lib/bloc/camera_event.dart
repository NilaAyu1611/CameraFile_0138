part of 'camera_bloc.dart';

@immutable
sealed class CameraEvent {}

final class InitializeCamera extends CameraEvent {}     //memicu inisialisasi kamera --> Digunakan saat halaman kamera dibuka untuk pertama kali agar daftar kamera siap digunakan
