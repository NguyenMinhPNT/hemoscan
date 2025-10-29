import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final _box = GetStorage();

  // Save data
  Future<void> saveData(String key, dynamic value) async {
    await _box.write(key, value);
  }

  // Read data
  T? readData<T>(String key) {
    return _box.read<T>(key);
  }

  // Remove data
  Future<void> removeData(String key) async {
    await _box.remove(key);
  }

  // Clear all data
  Future<void> clearAll() async {
    await _box.erase();
  }
}
