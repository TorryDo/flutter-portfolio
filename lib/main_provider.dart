import 'package:flutter/material.dart';
import 'package:portfolio/custom_themes.dart';
import 'package:portfolio/routes.dart';

import 'common/utils/logger/mixin_logger.dart';

class MainProvider extends ChangeNotifier with Logger {
  late MainNavigator mainNavigator;

  String _route = Routes.ABOUT_SCREEN;
  CustomTheme _theme = CustomTheme.light;

  get route => _route;
  get theme => _theme;
  get themeData => CustomThemes.getTheme(_theme);

  MainProvider({
    String route = Routes.ABOUT_SCREEN,
    CustomTheme theme = CustomTheme.light,
  }) {
    _route = route;
    _theme = theme;
  }

  void registerNavigator(MainNavigator mainNavigator) {
    this.mainNavigator = mainNavigator;
  }

  void setTheme(CustomTheme theme) {
    _theme = theme;
    notifyListeners();
  }



  void toRoute(String route) {
    mainNavigator.toRoute(route);
    _route = route;
  }

  get currentRoute => _route;
}

abstract class MainNavigator {
  void toRoute(String route);
}
