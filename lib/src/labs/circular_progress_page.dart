import 'dart:math' as Math;
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({ Key? key }) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  double percentage = 0.0;
  double newPercentage = 0.0;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    animationController.addListener(() {
      // debugPrint('Controller value: ${animationController.value}');
      percentage = lerpDouble(percentage, newPercentage, animationController.value)!;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){
          percentage = newPercentage;
          newPercentage += 10;
          if (newPercentage > 100) {
            newPercentage = 0;
            percentage = 0;
          }
          animationController.forward(from: 0.0);
          setState(() {});
        },
        ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 300.0,
          height: 300.0,
          // color: Colors.red,
          child: CustomPaint(
            painter: _MyRadialProgress(percentage),
          ),
        ),
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter{
  final num percentage;
  _MyRadialProgress(this.percentage);
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
          ..strokeWidth = 4
          ..color       = Colors.grey
          ..style       = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = Math.min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);




    final paintArc = Paint()
          ..strokeWidth = 10
          ..color       = Colors.pink
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