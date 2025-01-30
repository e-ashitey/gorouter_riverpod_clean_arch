import 'package:gorouter_riverpod_clean_arch/app/data/models/user_model.dart';
import 'package:gorouter_riverpod_clean_arch/app/data/preference_manager.dart';
import 'package:gorouter_riverpod_clean_arch/shared/utils/storage_constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class UserLocalDataSource {
  // Cache the user model
  Future<void> saveUser(UserModel user);

  // // Get cached user authentication - AuthUser(verified,message,accessToken,tokenType,expiresAt,)
  // Future<AuthUser?> get getAuthUser;

  // Get cached user details/profile
  Future<UserModel?> get getCurrentUser;

  // Clear user authentication status
  Future<void> clearAuth();
}

class UserLocalDataSourceImpl extends UserLocalDataSource {
  final PrefsManager _prefsManager;

  UserLocalDataSourceImpl(this._prefsManager);

  @override
  Future<UserModel?> get getCurrentUser async {
    final userCache = await _prefsManager.read(StorageConstants.prefsUser);

    if (userCache == null) return null;

    final user = UserModel.fromJson(userCache);

    return user;
  }

  @override
  Future<void> saveUser(UserModel user) async {
    return await _prefsManager.write(StorageConstants.prefsUser, user.toJson());
  }

  @override
  Future<void> clearAuth() async {
    await _prefsManager.deleteAll();
  }
}

final userLocalDataSourceProvider = Provider<UserLocalDataSource>((ref) {
  final prefsManager = ref.watch(prefsManagerProvider);
  return UserLocalDataSourceImpl(prefsManager);
});
