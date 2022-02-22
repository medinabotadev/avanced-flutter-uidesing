import 'package:custom_painter/src/theme/theme.dart';
import 'package:custom_painter/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return _MenuModel();
      },
      child: Scaffold(
        // body: PinterestMenu(),
        // body: PinterestGrid(),
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuPositioned(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuPositioned extends StatelessWidget {
  const _PinterestMenuPositioned({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Positioned(
      bottom: 30.0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Align(
          child: PinterestMenu(
            mostrar: mostrar,
            ),
        ),
      )
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double prevScroll = 0.0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > prevScroll && controller.offset  > 100.0) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
        print('Ocultar menu');
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
        print('Mostrar menu');
      }

      prevScroll = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30.0))
        ),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier{
  bool _mostrar = true;
  bool get mostrar => _mostrar;
  set mostrar(bool valor){
    _mostrar = valor;
    notifyListeners();
  }
}