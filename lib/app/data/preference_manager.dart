import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gorouter_riverpod_clean_arch/app/core_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrefsManager<T> {
  final FlutterSecureStorage _storage;

  PrefsManager(this._storage);

  Future<void> write(String key, T value) async {
    try {
      final jsonString = jsonEncode(value);
      await _storage.write(key: key, value: jsonString);
    } catch (error) {
      throw Exception(
          "Unsupported data type for secure storage: ${T.toString()}");
    }
  }

  Future read(String key) async {
    final jsonString = await _storage.read(key: key);
    if (jsonString == null) return null;

    final value = jsonDecode(jsonString);
    return value;
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}

final prefsManagerProvider = Provider<PrefsManager>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);

  return PrefsManager(secureStorage);
});
// Usage example:
// final secureStringStorage = PrefsManager<String>('my_secure_string');
// final secureIntStorage = PrefsManager<int>('my_secure_int');

// Future<void> saveData() async {
//   await secureStringStorage.write("This is a secure string");
//   await secureIntStorage.write(42);
// }

// Future<String?> readStringData() async {
//   return await secureStringStorage.read();
// }

// Future<int?> readIntData() async {
//   return await secureIntStorage.read();
// }
