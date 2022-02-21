import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final VoidCallback onPress;
  BotonGordo({ Key? key, required this.icon, required this.text, required this.color1, required this.color2, required this.onPress }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _BotonGordoBackground(icon: icon, color1: color1, color2: color2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 140.0, width: 40.0,),
            FaIcon(icon, color: Colors.white, size: 40.0,),
            SizedBox(width: 20.0,),
            Expanded(child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18),)),
            FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white, size: 40.0,),
            SizedBox(width: 40.0,)
          ],
        )
      ],
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const _BotonGordoBackground({
    Key? key, required this.icon, required this.color1, required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(icon, size: 150.0, color: Colors.white.withOpacity(0.2),),
            )
          ],
        ),
      ),
      width: double.infinity,
      height: 100.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2), offset: Offset(4, 6), blurRadius: 10.0
          )
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[
            color1,
            color2,
          ]
        )
      ),
    );
  }
}