import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';
import '../services/auth_service.dart';

final userProvider =
StateNotifierProvider<UserNotifier, UserModel?>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<UserModel?> {
  UserNotifier() : super(null);

  final UserService _userService = UserService();
  final AuthService _authService = AuthService();

  Future<void> fetchUser() async {
    final uid = _authService.currentUser!.uid;

    final data = await _userService.getUser(uid);

    if (data != null) {
      state = UserModel.fromMap(data);
    }
  }

  Future<void> updateUser({
    required String name,
    required String address,
    String? imageUrl,
  }) async {
    final uid = _authService.currentUser!.uid;

    await _userService.updateUser(
      uid: uid,
      data: {
        "name": name,
        "address": address,
        if (imageUrl != null) "imageUrl": imageUrl,
      },
    );

    state = UserModel(
      name: name,
      email: state!.email,
      address: address,
      imageUrl: imageUrl ?? state!.imageUrl,
    );
  }
}