import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    @Default(0) int id,
    @Default("") String username,
    @Default("") String email,
    @Default("") String firstName,
    @Default("") String lastName,
    @Default("") String gender,
    @Default("") String image,
    @Default("") String accessToken,
    @Default("") String refreshToken,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
