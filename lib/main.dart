import 'package:custom_painter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/pages/launcher_page.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: ((context) => ThemeChanger()),
      child: const MyApp()
    )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: LauncherPage()
    );
  }
}
