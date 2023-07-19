// import 'package:bionics/providers/aqubio_ble_provider.dart';
// import 'package:bionics/providers/async_save_data_provider.dart';
// import 'package:bionics/ui/page/firstboot/api.dart';
// import 'package:bionics/ui/page/firstboot/bloc/regist_view_model.dart';
// import 'package:bionics/utils/util.dart';
// import 'package:charset/charset.dart';
import 'package:aqubio/models/save_data_model.dart';
import 'package:aqubio/pages/initial_registration_page/regist_view_model.dart';
import 'package:aqubio/providers/async_save_data_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'regist_provider.g.dart';

@riverpod
class Regist extends _$Regist {
  @override
  RegistViewModel build() {
    print('びるど！');
    return RegistViewModel(
      // aaaaaaaaaaaaa
      pageIndex: ref.watch(
          asyncSaveDataProvider.select((value) => value.value?.pageIndex ?? 1)),
      isFirstBoot: ref.watch(asyncSaveDataProvider
          .select((value) => value.value?.isFirstBoot ?? true)),
      errorMessage: "",
    );
  }

  void clearErrorMessage() {
    state = state.copyWith(errorMessage: '');
  }

  void setError(String errorMessage) {
    state = state.copyWith(errorMessage: errorMessage);
  }

//   void currentFromSave(int savedIndex) async {
//     state = state.copyWith(pageIndex: savedIndex);
//   }

  void nextPage(int pageMax) async {
    final sv = ref.read(asyncSaveDataProvider).requireValue;
    final current = (sv.pageIndex + 1);

    SaveDataModel newSave;
    if (current == pageMax) {
      newSave = sv.copyWith(pageIndex: 0, isFirstBoot: false);
    } else {
      newSave = sv.copyWith(pageIndex: current);
    }
//    print(newSave);
    await ref.read(asyncSaveDataProvider.notifier).save(newSave);
  }

  void prevPage() async {
    final sv = ref.read(asyncSaveDataProvider).requireValue;
    final current = state.pageIndex > 0 ? state.pageIndex - 1 : 0;

    final newSave = sv.copyWith(pageIndex: current);
    await ref.read(asyncSaveDataProvider.notifier).save(newSave);
  }

//   void finish() async {
//     final sv = ref.read(asyncSaveDataProvider).requireValue;
//     final newSave = sv.copyWith(isFirstBoot: false);
//     await ref.read(asyncSaveDataProvider.notifier).save(newSave);
//   }

//   Future<void> initialAuth(String phone, String pinCode) async {
//     final model = await apiInitialAuth(phone, pinCode);
//     if (!model.result) {
//       final message = '${model.message!}\n電話番号とPINコードを確認してください。';
//       setError(message);
//       return;
//     }
//     // 後々必要になる情報を保存。
//     // 成功時は auth.app_user_id などが受け取れているはずである。
//     final newSave = ref.read(asyncSaveDataProvider).requireValue.copyWith(
//           appUserId: model.app_user_id!,
//           deviceId: model.device_id!,
//           apiVerifyKey: model.api_verify_key!,
//           name: model.name!,
//         );

//     // 必要な情報を保存するのを待ってから、次のページへ。
//     await ref.read(asyncSaveDataProvider.notifier).save(newSave);

//     nextPage(4);
//   }

//   void savePassword(String password) async {
//     final newSave = ref.read(asyncSaveDataProvider).value!.copyWith(
//           password: password,
//         );
//     await ref.read(asyncSaveDataProvider.notifier).save(newSave);
//     nextPage(4);
//   }

//   void _addSequenceStep(String step) {
//     state = state.copyWith(sequenceSteps: [...state.sequenceSteps, step]);
//   }

//   void _startSequenceStep() {
//     state = state
//         .copyWith(inSequence: true, sequenceSteps: ['初回登録開始', 'AQUBIO接続...']);
//   }

//   Future<void> startRegist() async {
//     final ble = ref.read(aqubioBleProvider.notifier);
//     final save = ref.read(asyncSaveDataProvider).requireValue;
//     // シーケンス開始。
//     _startSequenceStep();
//     _addSequenceStep('ローカルデータ取得API');

//     final model =
//         await apiGetLocalData(ref.read(asyncSaveDataProvider).requireValue);
//     if (!model.result) {
//       _addSequenceStep('失敗');
//       // エラー時は auth.message に理由が入っている。
//       final message = model.message!;
//       setError(message);
//       return;
//     }
//     _addSequenceStep('成功');

//     // 必要になる情報を保存。
//     final newSave = save.copyWith(
//       pubKey: model.pubKey!,
//       privKey: model.privKey!,
//       serialCode: model.Devices!.device.serial_code,
//       deviceId: model.Devices!.device_id,
//     );
//     await ref.read(asyncSaveDataProvider.notifier).save(newSave);

//     final ret = await ble.connectDevice(model.Devices!.device.serial_code);
//     if (ret != ConnectDeviceResult.success) {
//       _addSequenceStep('失敗');
//       final message = errorMessage[ret]!;
//       setError(message);
//       return;
//     }
//     debugPrint('接続成功!');
//     _addSequenceStep('成功');

//     await ble.startNotifer(_onData2);

//     //接続要求
//     await ble.sendCommandAqubioConnectionRequest(true);
//   }

//   // ---------------------------
//   // ここから下はあとから切り離したい

//   /// 公開キーからの情報から余計な部分を除去。
//   String trimKey(String key) {
//     var ret = key.replaceAll('-----BEGIN PUBLIC KEY-----', '');
//     ret = ret.replaceAll('-----END PUBLIC KEY-----', '');
//     ret = ret.replaceAll('\n', '');
//     return ret;
//   }

//   List<String> _intArrayToHexStringArray(List<int> intArray) {
//     final bufStrArray = <String>[];
//     for (var element in intArray) {
//       bufStrArray
//           .add("0x${element.toRadixString(16).padLeft(2, "0").toUpperCase()}");
//     }
//     return bufStrArray;
//   }

//   void _onData2(List<int> buff) async {
// //    final arr = _intArrayToHexStringArray(buff);
// //    debugPrint("<- AQUBIO $arr");
//     final ble = ref.read(aqubioBleProvider.notifier);
//     // 機器から受け取ったListはimutableなので
//     // 追加で飛んできたデータをaddしたい場合などに困る...
//     // ためList.fromでコピーして渡す。
//     if (!ble.resvAqubio(List.from(buff))) {
// //      print("まだ受信しきっていない");
//       return;
//     }

//     if (ble.isResponseCode) {
//       debugPrint("今回はレスポンスコードだった.");
//       if (ble.isACK) {
//         debugPrint("------------ACK-----------------");
//         print(Util.intArrayToHexStringArray(ble.buf).toString());
//       } else {
//         debugPrint(" -> ACKじゃないの来ました:${ble.responseCodeString}");
//         print(Util.intArrayToHexStringArray(ble.buf).toString());
//       }
//       return;
//     }
//     debugPrint("今回は応答だった");
//     if (ble.lastRecvServiceCode == 0x01) {
//       if (ble.lastRecvTypeCode == 0x81) {
//         debugPrint("--new 接続通知 応答");
//         final service = [0x01];
//         final cmd = [0x04];
//         final buf = <int>[0x00]; // 初回登録時は機器インデックスに0(サーバー)を指定
//         // ACKかえしてから...
//         await ble.sendAck();
//         debugPrint(" -> 機器認証開始 要求");
//         await ble.sendBle(service, cmd, buf);
//       }
//       if (ble.lastRecvTypeCode == 0x84) {
//         debugPrint("--new 機器認証開始 応答");
//         debugPrint(" -> 機器認証");

//         // AQUBIOから受け取った乱数はList<int>なので、それを0詰めの16進数文字列に変換。
//         // [1,10,255] -> "010AFF" のような形。
//         final random = ble.buf.sublist(5);
//         String randomNumStr = "";
//         for (final element in random) {
//           randomNumStr +=
//               element.toRadixString(16).padLeft(2, "0").toUpperCase();
//         }
//         final save = ref.read(asyncSaveDataProvider).requireValue;

//         debugPrint(" -> APIからコード取得");
//         final model = await getAuthCode(save, randomNumStr);
//         if (!model.result) {
//           // エラー時は auth.message に理由が入っている。
//           final message = model.message!;
//           setError(message);
//           return;
//         }

//         // サーバから受け取った "0141515542494f3230313948303237313907000000" のような文字列をバッファ化。
//         final text = model.text!;
//         final textBuf = Util.hexString2IntArray(text);

//         // サーバから受け取った、ETHJU6kdFNFD01onP7COnaadm+....EYW2Elp7cZxffQ==のようなBase64文字列。
//         final crypttext = model.crypttext!;
//         final decoded = base64.decode(crypttext);

// //        final serial = Util.string2Ascii(save.serialCode);

//         // BLE 機器認証結果 送信
//         final service = [0x01];
//         final cmd = [0x05];

//         // ここの通信では
//         // uint8_t[16]: AQUBIO側で生成した乱数
//         // uint8_t[16]: シリアルナンバー (ASCII)
//         // uint32_t: 許可ビット
//         // ・0x1: ペアリング ・0x2: ペアリング解除 ・0x4: 出荷初期化
//         // uint8_t[256]: 署名
//         // 16+16+4+256の計292バイトの情報を送る。

//         // サーバから受け取ったtextは16進文字列で、2文字ずつバラして数値に置き換えると
//         // [乱数, シリアル, 許可ビット] のバッファになる。
//         final buf = <int>[
//           ...textBuf,
//           ...decoded,
//         ];
//         // ACKかえしてから...
//         await ble.sendAck();
//         debugPrint(" -> 機器認証 要求${buf.length}");
//         await ble.sendBle(service, cmd, buf);
//       }
//       if (ble.lastRecvTypeCode == 0x85) {
//         debugPrint("--new 機器認証 応答:${ble.buf[5] == 0x00}");

//         final service = [0x01];
//         final cmd = [0x06];

//         final save = ref.read(asyncSaveDataProvider).requireValue;

//         final decodedPubkeyBuf = base64.decode(trimKey(save.pubKey));
//         final userName = save.name;
//         Utf32Encoder encoder = utf32.encoder as Utf32Encoder;
//         final enc = encoder.encodeUtf32Le(userName);
//         final nameEuc32 = enc.map((e) => e).toList();

//         // Utf32のLEで64バイト固定。空白は0x00で埋める。
//         final blank = List.filled(64 - nameEuc32.length, 0);
//         final nameBuf = [
//           ...nameEuc32,
//           ...blank,
//         ];
//         final buf = <int>[...nameBuf, ...decodedPubkeyBuf];

//         // ACKかえしてから...
//         await ble.sendAck();
//         debugPrint(" -> アプリ公開鍵登録 要求");
//         await ble.sendBle(service, cmd, buf);
//       }
//       if (ble.lastRecvTypeCode == 0x86) {
//         // data[0]:種別コード ↑
//         // data[1]:成否
//         // data[2]:機器インデックス
//         debugPrint("--new アプリ公開鍵登録 応答${ble.buf[5] == 0x00}");
//         debugPrint(" -> 諸々を保存し...");
//         final save = ref.read(asyncSaveDataProvider).requireValue;
//         final newSave = save.copyWith(deviceIndex: ble.buf[6]);
//         await ref.read(asyncSaveDataProvider.notifier).save(newSave);

//         // ACKかえしてから...
//         await ble.sendAck();
//         debugPrint(" -> 切断");

//         // 切断要求を送らないとピカピカしっぱなしなので要求。
//         await sendAqubioDisconnect();
//         state = state.copyWith(inSequence: false);
//         nextPage(4);
//       }
//     }
//   }

//   Future<void> sendAqubioDisconnect() async {
//     final service = [0x01];
//     final cmd = [0x03];
//     final buf = <int>[];
//     final ble = ref.read(aqubioBleProvider.notifier);
//     await ble.sendBle(service, cmd, buf);
//     await ble.stopNotifer(); //bleProvider.notifier).sendBle(service, cmd, buf);
//     await ble.disconnect();
//   }
}
