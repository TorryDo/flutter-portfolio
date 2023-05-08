import 'package:flutter/material.dart';
import 'package:portfolio/common/utils/framework/navigation_ext.dart';
import 'package:portfolio/routes.dart';

import 'common/utils/logger/mixin_logger.dart';

class MainProvider extends ChangeNotifier with Logger {
  bool _isDarkTheme = false;
  late MainNavigator mainNavigator;
  late ThemeData themeData;

  late String _route;

  MainProvider({
    bool isDarkTheme = false,
    String route = Routes.ABOUT_SCREEN
  }) {
    _isDarkTheme = isDarkTheme;
    themeData = isDarkTheme ? _darkTheme : _lightTheme;
    _route = route;
  }

  void registerNavigator(MainNavigator mainNavigator){
    this.mainNavigator = mainNavigator;
  }

  final ThemeData _lightTheme = ThemeData(
    colorSchemeSeed: Colors.blue,
    useMaterial3: true,
  );

  final ThemeData _darkTheme = ThemeData(
    colorSchemeSeed: Colors.blueGrey,
    useMaterial3: true,
  );

  set theme(bool darkThemeEnabled) {
    _isDarkTheme = darkThemeEnabled;
    themeData = _isDarkTheme ? _darkTheme : _lightTheme;
    notifyListeners();
  }

  set route(String route){
    _route = route;
    mainNavigator.toRoute(route);
  }



}

abstract class MainNavigator{
  void toRoute(String route);
}