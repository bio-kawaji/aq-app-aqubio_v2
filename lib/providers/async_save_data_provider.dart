import 'package:aqubio/models/save_data_model.dart';
import 'package:aqubio/repositories/app_save_data_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_save_data_provider.g.dart';

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
@riverpod
class AsyncSaveData extends _$AsyncSaveData {
  @override
  FutureOr<SaveDataModel> build() async {
    // セーブデータは一度読み込んだら画面全体で使いまわしたい。
    // 再読み込みはしないほうが望ましいためkeep.
    ref.keepAlive();
    final json = await ref.watch(sharedPreferensAppSaveDataProvider).load();
    if (json.isEmpty) {
      return SaveDataModel();
    }

    return SaveDataModel.fromJson(json);
  }

  Future<void> save(SaveDataModel save) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.watch(sharedPreferensAppSaveDataProvider).save(save);

      final json = await ref.watch(sharedPreferensAppSaveDataProvider).load();

      return SaveDataModel.fromJson(json);
    });
  }

  Future<void> clear() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final save = SaveDataModel();
      await ref.watch(sharedPreferensAppSaveDataProvider).save(save);
      return save;
    });
  }
}
