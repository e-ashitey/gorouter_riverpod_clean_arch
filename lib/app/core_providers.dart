import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final secureStorageProvider =
    Provider<FlutterSecureStorage>((ref) => throw UnimplementedError());
