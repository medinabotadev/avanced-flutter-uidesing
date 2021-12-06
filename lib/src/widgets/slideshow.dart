import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  const Slideshow({ Key? key,
  required this.slides, 
  this.puntosArriba = false,
  this.colorPrimario  = Colors.blue,
  this.colorSecundario = Colors.grey
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context){
              Provider.of<_SlideshowModel>(context).colorPrimario = colorPrimario;
              Provider.of<_SlideshowModel>(context).colorSecundario = colorSecundario;
              return Column(
                children: <Widget>[
                  if(puntosArriba) 
                    _Dots(slides.length),
                  Expanded(
                    child: _Slides(slides)
                  ),
                  if(!puntosArriba) 
                    _Dots(slides.length),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // children: <Widget>[
        //   _Dot(index: 0,),
        //   _Dot(index: 1,),
        //   _Dot(index: 2,),
        // ],
        children: List.generate(
          totalSlides,
          (index) => _Dot(index: index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 12.0,
      height: 12.0,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: (slideshowModel.currentPage >= index - 0.5 && slideshowModel.currentPage < index + 0.5) 
        ? slideshowModel.colorPrimario : slideshowModel.colorSecundario,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides( this.slides );

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((child) => _Slide(child)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide(
    this.slide
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30.0),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier{
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;

  double get currentPage => _currentPage;

  set currentPage(double currentPage){
    _currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => _colorPrimario;

  set colorPrimario(Color color){
    _colorPrimario = color;
    // notifyListeners();
  }

  Color get colorSecundario => _colorSecundario;

  set colorSecundario(Color color){
    _colorSecundario = color;
    // notifyListeners();
  }
}