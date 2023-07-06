import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InitialRegistrationPage extends HookConsumerWidget {
  const InitialRegistrationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('初回登録'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              '初回登録',
            ),
          ],
        ),
      ),
    );
  }
}
