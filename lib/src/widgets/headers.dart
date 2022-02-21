import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Color(0xff615aab),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
        color: Color(0xff615aab),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); // Paint seria el lapiz del lienzo

    // Propiedades de dicho lapiz
    lapiz.color       =  Color(0xff615aab);
    lapiz.style       =   PaintingStyle.stroke; // .fill // .stroke
    lapiz.strokeWidth = 2.0;

    final path = Path();

    // Dibujar con el path y el lapiz

    path.moveTo(0.0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); // Paint seria el lapiz del lienzo

    // Propiedades de dicho lapiz
    lapiz.color       =  Color(0xff615aab);
    lapiz.style       =   PaintingStyle.fill; // .fill // .stroke
    lapiz.strokeWidth = 2.0;

    final path = Path();

    // Dibujar con el path y el lapiz

    path.moveTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    // path.moveTo(0.0, size.height * 0.50);
    // path.lineTo(size.width, size.height * 0.50);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
class HeaderPico extends StatelessWidget {
  const HeaderPico({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); // Paint seria el lapiz del lienzo

    // Propiedades de dicho lapiz
    lapiz.color       =  Color(0xff615aab);
    lapiz.style       =   PaintingStyle.fill; // .fill // .stroke
    lapiz.strokeWidth = 2.0;

    final path = Path();

    // Dibujar con el path y el lapiz

    path.moveTo(0, size.height * 0.30);
    path.lineTo(size.width * 0.50, size.height * 0.40);
    path.lineTo(size.width, size.height * 0.35);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); // Paint seria el lapiz del lienzo

    // Propiedades de dicho lapiz
    lapiz.color       =  Color(0xff615aab);
    lapiz.style       =   PaintingStyle.fill; // .fill // .stroke
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lapiz

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width / 2, size.height * .35, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);


    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
class HeaderWave extends StatelessWidget {
  const HeaderWave({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); // Paint seria el lapiz del lienzo

    // Propiedades de dicho lapiz
    lapiz.color       =  Color(0xff615aab);
    lapiz.style       =   PaintingStyle.fill; // .fill // .stroke
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lapiz

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * .25, size.height * .30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * .75, size.height * .20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // path.lineTo(0, size.height * 0.25);
    // path.quadraticBezierTo(size.width / 4, size.height * .35, size.width / 2, size.height * 0.25);
    // path.lineTo(size.width / 2, 0);
    // path.moveTo(size.width / 2, size.height * 0.25);
    // path.quadraticBezierTo(size.width / 4 * 3, size.height * .175, size.width, size.height * 0.25);
    // path.lineTo(size.width, 0);
    // path.lineTo(size.width / 2, 0);


    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(center: Offset(165.0, 55.0), radius: 180.0);

    final Gradient gradient = LinearGradient(colors: const [
        Color(0xff6d05e8),
        Color(0xffc012ff),
        Color(0xff6d05fa),
    ]);

    final lapiz = Paint()..shader = gradient.createShader(rect);

    // Propiedades de dicho lapiz
    lapiz.color       =  Colors.red;
    lapiz.style       =   PaintingStyle.fill; // .fill // .stroke
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lapiz

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * .25, size.height * .30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * .75, size.height * .20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // path.lineTo(0, size.height * 0.25);
    // path.quadraticBezierTo(size.width / 4, size.height * .35, size.width / 2, size.height * 0.25);
    // path.lineTo(size.width / 2, 0);
    // path.moveTo(size.width / 2, size.height * 0.25);
    // path.quadraticBezierTo(size.width / 4 * 3, size.height * .175, size.width, size.height * 0.25);
    // path.lineTo(size.width, 0);
    // path.lineTo(size.width / 2, 0);


    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}


class IconHeader extends StatelessWidget {

  

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  IconHeader({
  required this.icon, 
  required this.titulo, 
  required this.subtitulo, 
  this.color1 = const Color(0xFF526BF6), 
  this.color2 = const Color(0xFF67ACF2)
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _IconHeaderBackground(color1: color1, color2: color2,),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(icon, size: 250.0, color: Colors.white.withOpacity(0.2),)
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 80.0,
              width: double.infinity,
            ),
            Text(subtitulo, style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.7)),),
            SizedBox(
              height: 20.0,
            ),
            Text(titulo, style: TextStyle(fontSize: 25, color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.bold),),
            SizedBox(
              height: 20.0,
            ),
            FaIcon(icon, size: 80.0, color: Colors.white,)
          ],
        ),
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  
  final Color color1;
  final Color color2;
  const _IconHeaderBackground({
    Key? key, required this.color1, required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
          color1,
          color2,
        ])
      ),
    );
  }
}