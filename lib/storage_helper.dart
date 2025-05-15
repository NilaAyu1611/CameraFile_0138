
import 'dart:io';

class StorageHelper {
  static Future<String> _getFolderPath() async {                                    //mengembalikan path folder penyimpanan khusus aplikasi --> Jika folder belum ada, maka akan dibuat terlebih dahulu
    final dir = Directory('/storage/emulated/0/DCIM/FlutterNativeCamBloc');
    if (!await dir.exists()) await dir.create(recursive: true);
    return dir.path;
  }
}