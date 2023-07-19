import 'package:aqubio/providers/async_save_data_provider.dart';
import 'package:aqubio/routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sv = ref.watch(asyncSaveDataProvider);
/*
    // このような感じで一部の情報だけを非同期で監視することも可。
    final index = ref.watch(asyncSaveDataProvider
        .select((value) => value.hasValue ? value.value?.pageIndex : -1));
    if (index != null) {
      print(index);
    } else {
      print('no data');
    }
*/
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // セーブデータ読込が完了したらホームへ。
      sv.when(
          // 読込完了
          data: (data) async {
            // 非同期でセーブデータが読み込めた。
            // これの画面以降は asyncSaveDataProvider は null ではない事が保証される。
            // sv.value!.xxxx  のように、積極的に!演算子を使っても良い。
            // sv.requireValue.xxxx でもよい。

            // 名前が微妙に適切ではないが、isFirstBoot が 初期登録済みかどうかを示すフラグ。
            final path = data.isFirstBoot
                ? '/firstboot' // 登録画面へ
                : '/login'; // ログイン画面
            await Future.delayed(const Duration(seconds: 1));

            if (context.mounted && ModalRoute.of(context)!.isCurrent) {
              Navigator.pushReplacementNamed(context, RoutePath.top);
            }
          },
          // 読込エラー
          error: (e, s) {
            // TODO エラー制御
//            showOkDIalog(context, message: 'セーブデータ読込エラー。アプリを再起動してください。');
          },
          // 読み込み中
          loading: () => null);
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'AQUBIO',
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('pop'))
          ],
        ),
      ),
    );
  }
}
