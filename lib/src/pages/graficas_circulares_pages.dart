import 'package:custom_painter/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GrqaficasCircularesPage extends StatefulWidget {
  const GrqaficasCircularesPage({ Key? key }) : super(key: key);

  @override
  State<GrqaficasCircularesPage> createState() => _GrqaficasCircularesPageState();
}

class _GrqaficasCircularesPageState extends State<GrqaficasCircularesPage> {
  double percentage = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            percentage +=  10;
            if (percentage > 100) {
              percentage = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(percentage: percentage, color: Colors.blue,),
              CustomRadialProgress(percentage: percentage, color: Colors.red,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(percentage: percentage, color: Colors.purple,),
              CustomRadialProgress(percentage: percentage, color: Colors.green,),
            ],
          )
        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  CustomRadialProgress({
    Key? key,
    required this.percentage,
    required this.color,
  }) : super(key: key);

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.0,
      height: 180.0,
      // color: Colors.red,
      child: RadialProgress(
        percentage: percentage,
        primaryColor: color,
        secondaryColor: Colors.grey,
        backGroundStroke: 5.0,
        mainStroke: 15.0,
      ),
    );
  }
}