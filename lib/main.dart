import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/provider/social_info_list_provider.dart';
import 'package:portfolio/utils/const.dart';
import 'package:portfolio/custom_themes.dart';
import 'package:portfolio/routes.dart';
import 'package:portfolio/src/presentation/main_navigator.dart';
import 'package:portfolio/utils/lib/provider/provider_ext.dart';
import 'package:provider/provider.dart';

import 'src/presentation/main_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const _SetupApp());
}

class _SetupApp extends StatelessWidget {
  const _SetupApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainProvider()),
        ChangeNotifierProvider(create: (context) => SocialInfoListProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MainProvider mainProvider;

  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = true;
  double groupAlignment = -1.0;

  List<String> routeNames = [
    Routes.ABOUT_SCREEN,
    Routes.SKILL_SCREEN,
    Routes.PROJECT_SCREEN,
    Routes.EXPERIENCE_SCREEN,
    Routes.CONTACT_SCREEN
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mainProvider = context.provider<MainProvider>();
  }

  bool extendLikeButton = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mainProvider.themeData,
      title: 'Tri Do Nguyen',
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: Const.sideBarWidth),
            child: const MainNavigator(),
          ),
          Row(
            children: [
              SizedBox(
                width: Const.sideBarWidth,
                height: double.infinity,
                child: NavigationRail(
                  selectedIndex: _selectedIndex,
                  groupAlignment: groupAlignment,
                  onDestinationSelected: _onDestinationSelected,
                  labelType: labelType,
                  leading: showLeading
                      ? FloatingActionButton(
                          elevation: 0,
                          onPressed: () {},
                          child: const Icon(Icons.add),
                        )
                      : const SizedBox(),
                  trailing: Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: showTrailing
                            ? FloatingActionButton(
                                elevation: 0,
                                onPressed: changeTheme,
                                tooltip: "Right-click to get more options",
                                child: getIconByTheme(mainProvider.theme),
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ),
                  destinations: const <NavigationRailDestination>[
                    NavigationRailDestination(
                      icon: Icon(Icons.person_outline),
                      selectedIcon: Icon(Icons.person),
                      label: Text('About'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.star_border),
                      selectedIcon: Icon(Icons.star),
                      label: Text('Skills'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.book_outlined),
                      selectedIcon: Icon(Icons.book),
                      label: Text('Projects'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.work_outline),
                      selectedIcon: Icon(Icons.work),
                      label: Text('Experiences'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.email_outlined),
                      selectedIcon: Icon(Icons.email),
                      label: Text('Contact'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 20),
                    child: MouseRegion(
                      onEnter: (PointerEnterEvent event){
                        setState(() {
                          extendLikeButton = true;
                        });
                      },
                      onExit: (PointerExitEvent event){
                        setState(() {
                          extendLikeButton = false;
                        });
                      },
                      child: FloatingActionButton.extended(
                        onPressed: () {},
                        label: const Text("42.083"),
                        icon: const Icon(Icons.thumb_up),
                        isExtended: extendLikeButton,
                        tooltip: "Gimme a like!",
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    mainProvider.navigateToRoute(routeNames[index]);
  }

  void changeTheme() {
    switch (mainProvider.theme) {
      case CustomTheme.light:
        mainProvider.setTheme(CustomTheme.dark);
        break;
      case CustomTheme.dark:
        mainProvider.setTheme(CustomTheme.light);
        break;
    }
  }

  Widget getIconByTheme(CustomTheme theme) {
    switch (theme) {
      case CustomTheme.light:
        return const Icon(Icons.light_mode);
      case CustomTheme.dark:
        return const Icon(Icons.dark_mode);
    }
  }
}
