import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String name,
    required String username,
    required String email,
    required Address address,
    required String phone,
    required String website,
    required Company company,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.defaultUser() => UserModel(
    id: 0,
    name: 'Default Name',
    username: 'default_user',
    email: 'default@example.com',
    address: Address.defaultAddress(),
    phone: '000-000-0000',
    website: 'default.com',
    company: Company.defaultCompany(),
  );
}

@freezed
class Address with _$Address {
  const factory Address({
    required String street,
    required String suite,
    required String city,
    required String zipcode,
    required Geo geo,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  factory Address.defaultAddress() => Address(
    street: 'Default Street',
    suite: 'Default Suite',
    city: 'Default City',
    zipcode: '00000',
    geo: Geo.defaultGeo(),
  );
}

@freezed
class Geo with _$Geo {
  const factory Geo({
    required String lat,
    required String lng,
  }) = _Geo;

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  factory Geo.defaultGeo() => Geo(lat: '0.0', lng: '0.0');
}

@freezed
class Company with _$Company {
  const factory Company({
    required String name,
    required String catchPhrase,
    required String bs,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  factory Company.defaultCompany() => const Company(
    name: 'Default Company',
    catchPhrase: 'Default Catchphrase',
    bs: 'Default BS',
  );
}
