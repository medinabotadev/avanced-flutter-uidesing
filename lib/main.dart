import 'package:flutter/material.dart';

import 'src/pages/slideshow_page.dart';

// import 'src/pages/slideshow_page.dart';
// import 'package:custom_painter/src/pages/headers_page.dart';
// import 'package:custom_painter/src/pages/animaciones_page.dart';
// import 'package:custom_painter/src/challenges/cuadrado_animado_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: SlideshowPage()
    );
  }
}
