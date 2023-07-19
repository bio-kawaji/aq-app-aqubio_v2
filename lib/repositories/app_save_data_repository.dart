import 'dart:async';
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// アプリのセーブデータを取得するリポジトリの抽象クラス。
abstract class AppSaveDataRepogitory {
  /// エンドポイント。SharedPreferensであればキー。
  /// セーブデータがどこかのAPIで取得するのであればそのurlなど。
  late final String _endPoint;
  AppSaveDataRepogitory(this._endPoint);

  /// セーブデータを取得する。
  Future<Map<String, dynamic>> load();

  /// セーブデータを保存する。
  Future<void> save(dynamic jsonMap);
}

/// SharedPreferensからアプリのセーブデータを取得するリポジトリ。
class SharedPreferensAppSaveDataRepogitory extends AppSaveDataRepogitory {
  SharedPreferensAppSaveDataRepogitory(String end) : super(end);
  @override
  Future<Map<String, dynamic>> load() async {
    final pref = await SharedPreferences.getInstance();
    final jsonText = pref.getString(_endPoint);
    print('しぇあーどぷりふぁれんす:ロード:$_endPoint');
    print(jsonText);
    if (jsonText == null) {
      return {};
    }
    final result = json.decode(jsonText) as Map<String, dynamic>;
    return result;
  }

  @override
  Future<void> save(dynamic jsonMap) async {
    final pref = await SharedPreferences.getInstance();
    final jsonText = json.encode(jsonMap);
    print('しぇあーどぷりふぁれんす:セーブ:$_endPoint');
    print(jsonText);

    pref.setString(_endPoint, jsonText);
  }
}

final sharedPreferensAppSaveDataProvider =
    Provider((ref) => SharedPreferensAppSaveDataRepogitory('app'));
