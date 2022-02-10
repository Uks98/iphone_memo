import 'package:flutter/material.dart';
import 'package:iphone_memo/component/theme_data.dart';
import 'package:iphone_memo/pages/momo_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Iphone memo',
        theme: DoryThemes.lightTheme,
      home: MemoMain(),
    );
  }
}

