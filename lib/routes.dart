import 'package:aqubio/pages/initial_registration_page/initial_registration.dart';
import 'package:aqubio/pages/top_page.dart';
import 'package:flutter/material.dart';

class RoutePath {
  /// トップ画面。現在はダミーにつきいつか消える。
  static const top = '/top';

  /// ログイン画面
  static const login = '/login';

  /// 初回登録画面。
  static const initialRegist = '/initial_regist';
}

final Map<String, WidgetBuilder> routeMap = {
  RoutePath.top: (context) => const TopPage(),
  // RoutePath.login: (context) => const LoginPage(),
  RoutePath.initialRegist: (context) => const InitialRegistrationPage(),

  // 新しい画面が追加されたらここにpathとそれに該当する画面を追加
};
