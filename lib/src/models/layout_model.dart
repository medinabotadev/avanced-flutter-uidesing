import 'package:flutter/material.dart';
import '../pages/slideshow_page.dart';

class LayoutModel with ChangeNotifier{
  Widget _currentPage = SlideshowPage();

  set currentPage(Widget page){
    _currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => _currentPage;
}