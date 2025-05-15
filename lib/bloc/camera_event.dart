part of 'camera_bloc.dart';


sealed class CameraEvent {}

final class InitializeCamera extends CameraEvent {}     //memicu inisialisasi kamera --> Digunakan saat halaman kamera dibuka untuk pertama kali agar daftar kamera siap digunakan

final class SwitchCamera extends CameraEvent {}         // memilih kamere yang digunakan (depan/belakng)

final class ToggleFlash extends CameraEvent {}          //aktif/nonaktif pencahayaan

final class TakePicture extends CameraEvent {
  final void Function(File imageFile) onPictureTaken;   //file hasil poto bisa diproses lebih lanjut (simpan/tampilkan)
  TakePicture(this.onPictureTaken);                     
}

final class TapToFocus extends CameraEvent {          //pritinjau kamre
  final Offset position;              
  final Size previewSize;
  TapToFocus(this.position, this.previewSize);
}



