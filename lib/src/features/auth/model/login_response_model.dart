import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    required bool status,
    String? tokenType,       // Make tokenType nullable
    String? token,           // Make token nullable
    required String message,
    required UserInfo dataInfo,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
}

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required int id,
    required String name,
    required String phone,
    required String email,
    DateTime? createdAt,     // Nullable field
    String? emailVerify,     // Nullable field
    required String role,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
}
