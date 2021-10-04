import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  const CuadradoAnimadoPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado()
      )
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> moveToRightAnimation;
  late Animation<double> moveToUpAnimation;
  late Animation<double> moveToLeftAnimation;
  late Animation<double> moveToDownAnimation;
  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 4000));
    moveToRightAnimation = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0.0, 0.25, curve: Curves.bounceOut))
    );
    moveToUpAnimation    = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0.25, 0.50, curve: Curves.bounceOut))
    );
    moveToLeftAnimation = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0.50, 0.75, curve: Curves.bounceOut))
    );
    moveToDownAnimation = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0.75, 1.0, curve: Curves.bounceOut))
    );

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        // controller.reverse();
        animationController.repeat();
      }
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
    animationController.forward();
    return AnimatedBuilder(
      child: _Rectangulo(),
      animation: animationController, 
      builder: (BuildContext context, child){
        return Transform.translate(
          offset: Offset(moveToRightAnimation.value - moveToLeftAnimation.value, moveToDownAnimation.value - moveToUpAnimation.value),
          child: child
        );
      }
    );
  }
}

class _Rectangulo extends StatelessWidget {
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