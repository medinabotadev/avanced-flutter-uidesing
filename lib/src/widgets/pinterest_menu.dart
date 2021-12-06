import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton{
  late final VoidCallback onPressed;
  late final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {


  final List<PinterestButton> items = [
    PinterestButton(icon: Icons.pie_chart, onPressed: (){debugPrint('pie_chart');}),
    PinterestButton(icon: Icons.search, onPressed: (){debugPrint('search');}),
    PinterestButton(icon: Icons.notifications, onPressed: (){debugPrint('notifications');}),
    PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){debugPrint('supervised_user_circle');}),
  ];
  bool mostrar;
  PinterestMenu({this.mostrar = true});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: mostrar ? 1 : 0,
        child: _PinterestMenuBackground(
          child: _MenuItems(items),
        ),
      )
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const _PinterestMenuBackground({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            spreadRadius: -5
          )
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index, menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget{
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 35 : 25,
          color: (itemSeleccionado == index) ? Colors.black : Colors.blueGrey,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{
  int _itemSeleccionado = 0;

  int get itemSeleccionado => _itemSeleccionado;
  set itemSeleccionado(int index){
    _itemSeleccionado = index;
    notifyListeners();
  }
}