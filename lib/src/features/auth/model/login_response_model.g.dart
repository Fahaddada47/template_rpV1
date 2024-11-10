// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseModelImpl _$$LoginResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginResponseModelImpl(
      status: json['status'] as bool,
      tokenType: json['tokenType'] as String?,
      token: json['token'] as String?,
      message: json['message'] as String,
      dataInfo: UserInfo.fromJson(json['dataInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResponseModelImplToJson(
        _$LoginResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'tokenType': instance.tokenType,
      'token': instance.token,
      'message': instance.message,
      'dataInfo': instance.dataInfo,
    };

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      emailVerify: json['emailVerify'] as String?,
      role: json['role'] as String,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'createdAt': instance.createdAt?.toIso8601String(),
      'emailVerify': instance.emailVerify,
      'role': instance.role,
    };
