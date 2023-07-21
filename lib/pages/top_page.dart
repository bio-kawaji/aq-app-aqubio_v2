import 'package:aqubio/providers/async_save_data_provider.dart';
import 'package:aqubio/routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopPage extends HookConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'トップページ',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  await ref.read(asyncSaveDataProvider.notifier).clear();
                  if (context.mounted) {
                    Navigator.pushNamed(context, RoutePath.initialRegist);
                  }
                },
                child: const Text('初回登録へ')),
          ],
        ),
      ),
    );
  }
}
