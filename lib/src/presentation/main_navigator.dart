import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/presentation/contact/contact_screen.dart';
import 'package:portfolio/src/presentation/home_contract.dart';
import 'package:portfolio/src/presentation/main_provider.dart';
import 'package:portfolio/src/presentation/project/project_screen.dart';
import 'package:portfolio/src/presentation/skill/skill_screen.dart';
import 'package:portfolio/utils/lib/provider/provider_ext.dart';

import '../../common/utils/logger/mixin_logger.dart';
import '../../routes.dart';
import 'about/about_screen.dart';
import 'experience/experience_screen.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator>
    with Logger
    implements MainContract {
  late MainProvider mainProvider;
  PageController pageController = PageController(keepPage: true);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mainProvider = context.provider();
    mainProvider.registerNavigator(this);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      pageSnapping: false,
      itemCount: Routes.list.length,
      itemBuilder: (BuildContext context, int index) {
        switch (Routes.list[index]) {
          case Routes.ABOUT_SCREEN:
            return const AboutScreen();
          case Routes.SKILL_SCREEN:
            return const SkillScreen();
          case Routes.PROJECT_SCREEN:
            return const ProjectScreen();
          case Routes.EXPERIENCE_SCREEN:
            return const ExperienceScreen();
          case Routes.CONTACT_SCREEN:
            return const ContactScreen();
          default:
            return const AboutScreen();
        }
      },
    );
  }

  //region Implement contracts
  @override
  void navigateTo(String route) {
    pageController.jumpToPage(Routes.list.indexOf(route));
  }

//endregion
}
