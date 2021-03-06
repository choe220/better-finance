import 'package:better_finance/views/login_page.dart';
import 'package:better_finance/util/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Better Finance',
      theme: themeTwo,
      home: const LoginPage(),
    );
  }
}
