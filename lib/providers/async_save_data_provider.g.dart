// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'async_save_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$asyncSaveDataHash() => r'ec58764dfbcd8dafbe13d529fd41202bfc98999f';

/// 非同期にセーブデータを読み込む。<br>
/// ---
/// <b>基本</b><br>
/// ```
/// Widget build(BuildContext context, WidgetRef ref) {
///   final asyncSaveProv = ref.read(asyncSaveDataProvider.notifier);
///   final asyncSaveStat = ref.watch(asyncSaveDataProvider);
///   // まだセーブデータが読み込めていない場合は "no data" と表示
///   // 読み込み後はセーブデータの内容を表示します。
///   return Text(asyncSaveStat.value?.myData ?? 'no data');
/// }
/// ```
/// 1.AsyncStateNotifierの場合、asyncSaveStat.value が state の中身である。<br>
/// 2.その名の通り非同期につき、asyncSaveStat を初めて watch した瞬間は<br>
/// 　asyncSaveStat.value == null。<br>
/// 3.asyncSaveDataProviderがセーブデータを読込むと、state全体が更新され<br>
/// 　画面が再描画される。<br>
/// 4.画面が再描画されると、asyncSaveStat.value は !null となり情報にアクセスできる。<br>
/// 5.これらの理由から、`Text(asyncSaveStat.value?.myData ?? 'no data')`のように<br>
/// 　まだ情報が読み込めていない場合は...とnullセーフな書き方が必要。
/// ---
/// <b>データの保存</b><br>
/// ```
/// ElevatedButton(
///   child: const Text('保存'),
///   onPressed: () async {
///     if (!asyncSaveState.hasValue) {
///       return; // まだ元のセーブデータ読めてない。
///     }
///     final update =
///         asyncSaveState.value!.copyWith(someData: 'ステージ１クリア的な情報');
///       await asyncSaveProv.save(update);
///     });
/// ```
/// 以下、より詳細はRiverpod公式参照
/// [https://docs-v2.riverpod.dev/docs/providers/notifier_provider]
/// ---
/// <b>データの有無</b><br>
///```
/// // もうデータが読み込み済み。
/// if (asyncSaveState.hasValue) {
///   print(asyncSaveState.value.myData);
/// }
/// // データ読み込み中。
/// if (asyncSaveState.isLoading) {
///   print('まだロード中です。');
/// }
/// // 非同期処理でエラーが発生した。
/// if (asyncSaveState.hasError) {
///   print(asyncSaveState.error.toString());
/// }
///```
/// ---
/// <b>データの有無その２</b><br>
/// UIの描画を変えたい場合は、whenで切替可能。<br>
/// ```
/// asyncSaveState.when(
///   data: (value) {
///     // 読み込み済みの場合その値を表示。
///     return Text(value.myData);
///   },
///   error: (error, trace) {
///     // エラー内容表示
///     return Text(error.toString());
///   },
///   loading: () {
///     // 読み込み中はプログレス的な。
///     return return const CircularProgressIndicator();
///   });
/// ```
///
/// Copied from [AsyncSaveData].
@ProviderFor(AsyncSaveData)
final asyncSaveDataProvider =
    AutoDisposeAsyncNotifierProvider<AsyncSaveData, SaveDataModel>.internal(
  AsyncSaveData.new,
  name: r'asyncSaveDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$asyncSaveDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AsyncSaveData = AutoDisposeAsyncNotifier<SaveDataModel>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
