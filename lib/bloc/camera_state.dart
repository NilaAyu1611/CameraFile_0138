part of 'camera_bloc.dart';

@immutable
sealed class CameraState {}

final class CameraInitial extends CameraState {}

final class CameraReady extends CameraState {         //state utama saat kamera siap digunakan
  final CameraController controller;            
  final int selectedIndex;
  final FlashMode flashMode;
  final File? imageFile;
  final String? snackbarMessage;

    CameraReady({
    required this.controller,
    required this.selectedIndex,
    required this.flashMode,
    this.imageFile,
    this.snackbarMessage,
  });

  CameraReady copyWith({                        //tambah method copyWith untuk membuat salinan CameraReady dengan perubahan sebagian properti
    CameraController? controller,
    int? selectedIndex,
    FlashMode? flashMode,
    File? imageFile,
    String? snackbarMessage,
    bool clearSnackbar = false,
  }) {
    return CameraReady(
      controller: controller ?? this.controller,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      flashMode: flashMode ?? this.flashMode,
      imageFile: imageFile ?? this.imageFile,
      snackbarMessage:
          clearSnackbar ? null : snackbarMessage ?? this.snackbarMessage,
    );
  }

}