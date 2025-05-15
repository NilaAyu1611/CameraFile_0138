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

final class PickImageFromGallery extends CameraEvent {}     //pemilihan gambar dr galeri

final class OpenCameraAndCapture extends CameraEvent {         //buka,tangkap,menggunakan kamera  -> diperlukan navigasi
  final BuildContext context;
  OpenCameraAndCapture(this.context);
}

final class DeleteImage extends CameraEvent {}      //hapus gambar yang sudah diambil atau dipilih dari galeri

final class ClearSnackbar extends CameraEvent {}    //ersihkan pesan snackbar dari state agar tidak ditampilkan berulang kali

final class RequestPermissions extends CameraEvent {}   //eminta izin kamera dan penyimpanan kepada pengguna, sebelum menjalankan fitur kamera atau galeri

