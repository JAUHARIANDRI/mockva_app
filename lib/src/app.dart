import 'package:flutter/material.dart';
import 'package:mockva_app/src/pages/auth/login_page.dart';
import 'package:mockva_app/src/utils/values/themes.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      home: const LoginPage(),
    );
  }
}
