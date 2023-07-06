import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_data_model.freezed.dart';
part 'save_data_model.g.dart';

@freezed
class SaveDataModel with _$SaveDataModel {
//  const HomeModel._(); // 独自関数などを追加したい場合はこうする。
  factory SaveDataModel([
    @Default(0) int pageIndex,
    @Default('') String password,
    @Default(true) bool isFirstBoot,
    @Default(-1) int appUserId, // idが0開始だとappUserId==0さんになるので-1にしておく
    @Default(-1) int deviceId, // idが0開始だとdeviceId==0の機械になるので-1にしておく
    @Default('') String apiVerifyKey,
    @Default('') String name,
    @Default('') String pubKey,
    @Default('') String privKey,
    @Default(-1) int deviceIndex,
    @Default('') String serialCode,
    @Default(50) int bleWait,
  ]) = _SaveDataModel;
  factory SaveDataModel.fromJson(Map<String, dynamic> json) =>
      _$SaveDataModelFromJson(json);
}
