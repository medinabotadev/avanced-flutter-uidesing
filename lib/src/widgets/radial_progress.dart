import 'dart:math' as Math;
import 'dart:ui';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double mainStroke;
  final double backGroundStroke;
  const RadialProgress({ Key? key, 
  required this.percentage,
  this.primaryColor     = Colors.blue,
  this.secondaryColor   = Colors.grey,
  this.mainStroke       = 10.0,
  this.backGroundStroke = 4.0
  }) : super(key: key);

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late num prevPercetage;

  @override
  void initState() {
    prevPercetage = widget.percentage;
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward(from: 0.0);
    final animationDifference = widget.percentage - prevPercetage;
    prevPercetage = widget.percentage;
    return AnimatedBuilder(
      animation: animationController, 
      builder: (BuildContext context, child){
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(10.0),
          child: CustomPaint(
            painter: _MyRadialProgress(
              percentage: (widget.percentage - animationDifference) + (animationDifference * animationController.value),
              primaryColor: widget.primaryColor,
              secondaryColor: widget.secondaryColor,
              mainStroke: widget.mainStroke,
              backGroundStroke: widget.backGroundStroke
            ),
          ),
        );
      }
    );
  }
}

class _MyRadialProgress extends CustomPainter{
  final num percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double mainStroke;
  final double backGroundStroke;
  _MyRadialProgress({
    required this.percentage,
    required this.primaryColor,
    required this.secondaryColor,
    required this.mainStroke,
    required this.backGroundStroke
  });
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(center: Offset(0,0), radius: 180);

    final Gradient gradient = LinearGradient(
      colors: <Color>[
        Color(0xffc012ff),
        Color(0xff6d05e8),
        primaryColor
      ]
    );

    final paint = Paint()
          ..strokeWidth = backGroundStroke
          ..color       = secondaryColor
          ..style       = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = Math.min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);




    final paintArc = Paint()
          ..strokeWidth = mainStroke
          // ..color       = primaryColor
          ..shader      = gradient.createShader(rect)
          ..strokeCap   = StrokeCap.round
          ..style       = PaintingStyle.stroke;

    double arcAngle = 2 * Math.pi * (percentage / 100);
    canvas.drawArc(
    Rect.fromCircle(center: center, radius: radius),
    -Math.pi / 2, 
    arcAngle, 
    false, 
    paintArc
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}