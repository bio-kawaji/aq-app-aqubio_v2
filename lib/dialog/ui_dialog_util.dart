import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showOkDIalog(
  BuildContext context, {
  String title = '',
  String message = '',
  String ok = '',
  Function? onOk,
}) async {
  await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
                child: Text(ok),
                onPressed: () {
                  Navigator.pop(context);
                  onOk?.call();
                }),
          ],
        );
      });
}

Future<void> showYesNoDIalog(
  BuildContext context, {
  String title = '',
  String message = '',
  String ok = '',
  String cancel = '',
  Function? onOk,
  Function? onCancel,
}) async {
  await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
                child: Text(cancel),
                onPressed: () {
                  Navigator.pop(context);
                  onCancel?.call();
                }),
            TextButton(
                child: Text(ok),
                onPressed: () {
                  Navigator.pop(context);
                  onOk?.call();
                }),
          ],
        );
      });
}

// カプチーノテーマを使ったダイアログがAndroidでクラッシュするので使わない。
// 何か理由があるかもしれないので非推奨にして残しておく。
@Deprecated('migration')
Future<void> daialogAleart(
  BuildContext context, {
  String title = '',
  String content = '',
  String ok = '',
  String cancel = '',
  Function? onOk,
  Function? onCancel,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(cancel),
            isDestructiveAction: true,
            onPressed: () async {
              Navigator.pop(context);
              if (onCancel != null) {
                onCancel();
              }
            },
          ),
          CupertinoDialogAction(
            child: Text(ok),
            onPressed: () async {
              Navigator.pop(context);
              if (onOk != null) {
                onOk();
              }
            },
          ),
        ],
      );
    },
  );
}

@Deprecated('migration')
Future<void> daialogCaution(
  BuildContext context, {
  String title = '',
  String content = '',
  String ok = '',
  Function? onOk,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(ok),
            onPressed: () async {
              Navigator.pop(context);
              if (onOk != null) {
                onOk();
              }
            },
          ),
        ],
      );
    },
  );
}

Future<void> daialogProgress(
  BuildContext context,
) async {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 250), // ダイアログフェードインmsec
    barrierColor: Colors.black.withOpacity(0.5), // 画面マスクの透明度
    pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

Future<void> daialogTextProgress(
  BuildContext context, {
  String text = '',
}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return SimpleDialog(
        title: Text(text),
        children: const <Widget>[
          SimpleDialogOption(
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      );
    },
  );
}

Future<String> daialogTextField(
  BuildContext context, {
  String title = '',
  String text = '',
}) async {
  var _editText = text;
  var _alertText = text;
  await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: TextField(
        onChanged: (value) {
          _editText = value;
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () {
            _alertText = _editText;
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
  return _alertText;
}
