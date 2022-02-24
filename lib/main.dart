import 'package:custom_painter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/models/layout_model.dart';
import 'src/pages/launcher_page.dart';
import 'src/pages/launcher_tablet_page.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(create: (context) => ThemeChanger(2)),
        ChangeNotifierProvider<LayoutModel>(create: (context) => LayoutModel()),
      ],
      child: MyApp(),
    )
  );
}

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: ((context) => ThemeChanger(2)),
//       child: const MyApp()
//     )
//   );
// }
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation){
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
          // print(orientation);
          // return Container(
          //   child: LauncherPage(),
          // );
        },
      )
    );
  }
}
