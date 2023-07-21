import 'package:freezed_annotation/freezed_annotation.dart';

part 'regist_view_model.freezed.dart';
part 'regist_view_model.g.dart';

@freezed
class RegistViewModel with _$RegistViewModel {
  factory RegistViewModel({
    required int pageIndex,
    required bool isFirstBoot,
    required String errorMessage,
  }) = _RegistViewModel;

  factory RegistViewModel.fromJson(Map<String, dynamic> json) =>
      _$RegistViewModelFromJson(json);
}
