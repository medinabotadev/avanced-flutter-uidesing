import 'package:flutter/material.dart';

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