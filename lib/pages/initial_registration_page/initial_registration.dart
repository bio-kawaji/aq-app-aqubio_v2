import 'package:aqubio/dialog/ui_dialog_util.dart';
import 'package:aqubio/pages/initial_registration_page/regist_provider.dart';
import 'package:aqubio/providers/async_save_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InitialRegistrationPage extends HookConsumerWidget {
  const InitialRegistrationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pages = [
      const Step('すてっぷ1'),
      const Step('すてっぷ2'),
      const Step('すてっぷ3'),
      const Step('すてっぷ4'),
    ];

    final sv = ref.watch(asyncSaveDataProvider);
    print(sv);

    final model = ref.watch(registProvider);

    // 初回登録がどこまで進んでいるか？セーブから非同期で読み込まれ、初期値は0
    final pageIndex = model.pageIndex;
    print(pageIndex);
    final errorMessage = model.errorMessage;
    final isFirstBoot = model.isFirstBoot;

    // 実際にPageViewで表示しているページ。
    final currentPageViewIndex = useState(pageIndex);

    final controller = PageController(viewportFraction: 1.0);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // // ユーザー登録完了している
      if (!isFirstBoot) {
        // 登録完了済み
        // TODO とりあえず今はダミーのトップへ
        Navigator.pop(context);
        return;
      }

      if (ref.read(registProvider).errorMessage.isNotEmpty) {
        await showOkDIalog(context,
            title: 'エラーが発生しました', message: errorMessage, ok: '閉じる');
        ref.read(registProvider.notifier).clearErrorMessage();
      }

      // ページが切り替わっていなければ何もしない。
      if (pageIndex == currentPageViewIndex.value) {
        return;
      }

      // セーブから前回の画面を復元した場合ページを移動する。
      controller.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });

    final titles = [
      'ユーザー登録',
      'パスワード登録',
      '機器との接続',
      '接続完了',
    ];

    return SafeArea(
      child: Scaffold(
        //カルーセルページ
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.yellow,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: SizedBox(
                    height: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          titles[pageIndex],
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 16),
                        const Text('なにかラベル的な'),
                        // SmoothPageIndicator(
                        //   controller: controller,
                        //   count: 4,
                        //   effect: const WormEffect(
                        //     dotHeight: 16,
                        //     dotWidth: 16,
                        //     type: WormType.thin,
                        //     // strokeWidth: 5,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 12,
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padEnds: true,
                    controller: controller,
                    itemCount: pages.length,
                    itemBuilder: (_, index) => pages[index],
                    onPageChanged: (value) =>
                        currentPageViewIndex.value = value,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(color: Colors.blue),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    onPressed: () {
                      ref.read(registProvider.notifier).prevPage();
                    },
                    child: const Text('戻る'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(registProvider.notifier).nextPage(4);
                    },
                    child: const Text('次へ'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(registProvider.notifier).setError('えら〜');
                    },
                    child: const Text('エラー発生'),
                  ),
                ]),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Step extends HookConsumerWidget {
  final String msg;
  const Step(this.msg, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Container(
      color: Colors.green,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(msg),
          ],
        ),
      ),
    ));
  }
}
