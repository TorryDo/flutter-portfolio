import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/utils/framework/navigation_ext.dart';
import 'package:portfolio/main_provider.dart';
import 'package:portfolio/src/presentation/project/project_screen.dart';
import 'package:portfolio/src/presentation/skill/skill_screen.dart';
import 'package:portfolio/utils/lib/provider/provider_ext.dart';

import '../../common/utils/logger/mixin_logger.dart';
import '../../routes.dart';
import 'about/about_screen.dart';
import 'contact/contact_screen.dart';
import 'experience/experience_screen.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> with Logger implements MainNavigator {

  late MainProvider mainProvider;

  BuildContext? _navigatorContext;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mainProvider = context.provider();
    mainProvider.registerNavigator(this);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.ABOUT_SCREEN:
            return MaterialPageRoute(
              builder: (context){
                _navigatorContext = context;
                return AboutScreen();},
              settings: settings,
            );
          case Routes.SKILL_SCREEN:
            return MaterialPageRoute(
              builder: (context){
                _navigatorContext = context;
                return SkillScreen();},
              settings: settings,
            );
          case Routes.PROJECT_SCREEN:
            return MaterialPageRoute(
              builder: (context){
                _navigatorContext = context;
                return ProjectScreen();},
              settings: settings,
            );
          case Routes.EXPERIENCE_SCREEN:
            return MaterialPageRoute(
              builder: (context){
                _navigatorContext = context;
                return ExperienceScreen();},
              settings: settings,
            );
          case Routes.CONTACT_SCREEN:
            return MaterialPageRoute(
              builder: (context){
                _navigatorContext = context;
                return ContactScreen();},
              settings: settings,
            );
          default:
            return MaterialPageRoute(
              builder: (context){
                _navigatorContext = context;
                return AboutScreen();},
              settings: settings,
            );
        }
      },
    );
  }

  @override
  void toRoute(String route) {
    _navigatorContext?.pushNamed(route);
  }
}
