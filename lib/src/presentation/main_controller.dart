import 'dart:async';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../routes.dart';

class MainController{

  static final _indexStream = StreamController<int>();
  static Stream<int> get indexStream => _indexStream.stream;
  static ItemScrollController scrollController = ItemScrollController();

  static int currentIndex = 0;

  static void setIndex(int index){
    currentIndex = index;
    _indexStream.sink.add(index);
  }

}