import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _ListaTareas(),
      body: Stack(
        children: <Widget>[
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BotonNewList()
          )
        ],
      ),
    );
  }
}

class _BotonNewList extends StatelessWidget {
  const _BotonNewList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width * 0.9,
      height: 100,
      child: RaisedButton(
        color: Color(0xFFED6762),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0))),
        onPressed: () {

        },
        child: Text('Create new list', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold, letterSpacing: 3),),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem( titulo: 'Orange', color: Color(0xffF08F66) ),
    _ListItem( titulo: 'Family', color: Color(0xffF2A38A) ),
    _ListItem( titulo: 'Subscriptions', color: Color(0xffF7CDD5) ),
    _ListItem( titulo: 'Books', color: Color(0xffFCEBAF) ),
    _ListItem( titulo: 'Orange', color: Color(0xffF08F66) ),
    _ListItem( titulo: 'Family', color: Color(0xffF2A38A) ),
    _ListItem( titulo: 'Subscriptions', color: Color(0xffF7CDD5) ),
    _ListItem( titulo: 'Books', color: Color(0xffFCEBAF) ),
  ];
  _MainScroll({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        // SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.red,
        //   title: Text('Hola mundo'),
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            maxHeight: 200,
            minHeight: 180,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white, child: _Titulo(),)
          )
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ...items,
              SizedBox(height: 100.00,)
            ]
          )
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate{
  final double minHeight;
  final double maxHeight;
  final Widget child;
  _SliverCustomHeaderDelegate({required this.minHeight, required this.maxHeight, required this.child});
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return  maxHeight != oldDelegate.maxHeight ||
            minHeight != oldDelegate.minHeight ||
            child     != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 30.0,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text('New', style: TextStyle(color: Color(0xFF532128), fontSize: 50,)),
        ),
        Stack(
          children: <Widget>[
            SizedBox(width: 100,),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150.0,
                height: 8.0,
                decoration: BoxDecoration(
                  color: Color(0XFFF7CDD5)
                ),
              ),
            ),
            Container(
              child: Text('List', style: TextStyle(color: Color(0xFFD93A30), fontSize: 50, fontWeight: FontWeight.bold),),
            ),
          ],
        )
      ],
    );
  }
}


class _ListaTareas extends StatelessWidget {
    final items = [
    _ListItem( titulo: 'Orange', color: Color(0xffF08F66) ),
    _ListItem( titulo: 'Family', color: Color(0xffF2A38A) ),
    _ListItem( titulo: 'Subscriptions', color: Color(0xffF7CDD5) ),
    _ListItem( titulo: 'Books', color: Color(0xffFCEBAF) ),
    _ListItem( titulo: 'Orange', color: Color(0xffF08F66) ),
    _ListItem( titulo: 'Family', color: Color(0xffF2A38A) ),
    _ListItem( titulo: 'Subscriptions', color: Color(0xffF7CDD5) ),
    _ListItem( titulo: 'Books', color: Color(0xffFCEBAF) ),
  ];
  _ListaTareas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index){
        return items[index];
      },
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;
  const _ListItem({
    Key? key, required this.titulo, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30.0),
      child: Text(titulo, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
      height: 130.00,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}