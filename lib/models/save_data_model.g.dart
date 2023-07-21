// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SaveDataModel _$$_SaveDataModelFromJson(Map<String, dynamic> json) =>
    _$_SaveDataModel(
      json['pageIndex'] as int? ?? 0,
      json['password'] as String? ?? '',
      json['isFirstBoot'] as bool? ?? true,
      json['appUserId'] as int? ?? -1,
      json['deviceId'] as int? ?? -1,
      json['apiVerifyKey'] as String? ?? '',
      json['name'] as String? ?? '',
      json['pubKey'] as String? ?? '',
      json['privKey'] as String? ?? '',
      json['deviceIndex'] as int? ?? -1,
      json['serialCode'] as String? ?? '',
      json['bleWait'] as int? ?? 50,
    );

Map<String, dynamic> _$$_SaveDataModelToJson(_$_SaveDataModel instance) =>
    <String, dynamic>{
      'pageIndex': instance.pageIndex,
      'password': instance.password,
      'isFirstBoot': instance.isFirstBoot,
      'appUserId': instance.appUserId,
      'deviceId': instance.deviceId,
      'apiVerifyKey': instance.apiVerifyKey,
      'name': instance.name,
      'pubKey': instance.pubKey,
      'privKey': instance.privKey,
      'deviceIndex': instance.deviceIndex,
      'serialCode': instance.serialCode,
      'bleWait': instance.bleWait,
    };
