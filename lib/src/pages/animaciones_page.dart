import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double>   rotation;
  late Animation<double>   opacity;
  late Animation<double>   opacityOut;
  late Animation<double>   moveToRight;
  late Animation<double>   scale;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 4000));
    rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticOut)
    );

    opacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.easeInOutExpo))
    );

    moveToRight = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticOut)
    );

    scale = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticOut)
    );

    opacityOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.easeInOutExpo))
    );

    controller.addListener(() {
      // print('Status: ${controller.status}');
      if (controller.status == AnimationStatus.completed) {
        // controller.reverse();
        controller.repeat();
      }
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
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child:  _Rectangulo(),
      builder: (BuildContext context, childRectangulo){
        // debugPrint('Opacidad: ${opacity.value}');
        // debugPrint('Rotacion: ${rotation.value}');
        // debugPrint('MoveToRight: ${moveToRight.value}');
        // debugPrint('Scale: ${scale.value}');
        return Transform.translate(
          offset: Offset(moveToRight.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value - opacityOut.value,
              child: Transform.scale(
                scale: scale.value,
                child: childRectangulo
              )
            )
          ),
        );
      },
    );
  }
}




















class _Rectangulo extends StatelessWidget {
  const _Rectangulo({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}