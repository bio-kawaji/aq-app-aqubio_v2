// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'regist_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegistViewModel _$RegistViewModelFromJson(Map<String, dynamic> json) {
  return _RegistViewModel.fromJson(json);
}

/// @nodoc
mixin _$RegistViewModel {
  int get pageIndex => throw _privateConstructorUsedError;
  bool get isFirstBoot => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistViewModelCopyWith<RegistViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistViewModelCopyWith<$Res> {
  factory $RegistViewModelCopyWith(
          RegistViewModel value, $Res Function(RegistViewModel) then) =
      _$RegistViewModelCopyWithImpl<$Res, RegistViewModel>;
  @useResult
  $Res call({int pageIndex, bool isFirstBoot, String errorMessage});
}

/// @nodoc
class _$RegistViewModelCopyWithImpl<$Res, $Val extends RegistViewModel>
    implements $RegistViewModelCopyWith<$Res> {
  _$RegistViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
    Object? isFirstBoot = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isFirstBoot: null == isFirstBoot
          ? _value.isFirstBoot
          : isFirstBoot // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegistViewModelCopyWith<$Res>
    implements $RegistViewModelCopyWith<$Res> {
  factory _$$_RegistViewModelCopyWith(
          _$_RegistViewModel value, $Res Function(_$_RegistViewModel) then) =
      __$$_RegistViewModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pageIndex, bool isFirstBoot, String errorMessage});
}

/// @nodoc
class __$$_RegistViewModelCopyWithImpl<$Res>
    extends _$RegistViewModelCopyWithImpl<$Res, _$_RegistViewModel>
    implements _$$_RegistViewModelCopyWith<$Res> {
  __$$_RegistViewModelCopyWithImpl(
      _$_RegistViewModel _value, $Res Function(_$_RegistViewModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
    Object? isFirstBoot = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_RegistViewModel(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isFirstBoot: null == isFirstBoot
          ? _value.isFirstBoot
          : isFirstBoot // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegistViewModel implements _RegistViewModel {
  _$_RegistViewModel(
      {required this.pageIndex,
      required this.isFirstBoot,
      required this.errorMessage});

  factory _$_RegistViewModel.fromJson(Map<String, dynamic> json) =>
      _$$_RegistViewModelFromJson(json);

  @override
  final int pageIndex;
  @override
  final bool isFirstBoot;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'RegistViewModel(pageIndex: $pageIndex, isFirstBoot: $isFirstBoot, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegistViewModel &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex) &&
            (identical(other.isFirstBoot, isFirstBoot) ||
                other.isFirstBoot == isFirstBoot) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pageIndex, isFirstBoot, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegistViewModelCopyWith<_$_RegistViewModel> get copyWith =>
      __$$_RegistViewModelCopyWithImpl<_$_RegistViewModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegistViewModelToJson(
      this,
    );
  }
}

abstract class _RegistViewModel implements RegistViewModel {
  factory _RegistViewModel(
      {required final int pageIndex,
      required final bool isFirstBoot,
      required final String errorMessage}) = _$_RegistViewModel;

  factory _RegistViewModel.fromJson(Map<String, dynamic> json) =
      _$_RegistViewModel.fromJson;

  @override
  int get pageIndex;
  @override
  bool get isFirstBoot;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_RegistViewModelCopyWith<_$_RegistViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
