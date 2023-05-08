import 'package:flutter/material.dart';
import 'package:portfolio/const.dart';
import 'package:portfolio/custom_themes.dart';
import 'package:portfolio/routes.dart';
import 'package:portfolio/src/presentation/app_navigator.dart';
import 'package:portfolio/utils/lib/provider/provider_ext.dart';
import 'package:provider/provider.dart';

import 'main_provider.dart';

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
            child: const AppNavigator(),
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
                          onPressed: () {
                            // Add your onPressed code here!
                          },
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
              Container(
                width: 2,
                height: double.infinity,
                color: Colors.grey,
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
    mainProvider.toRoute(routeNames[index]);
  }

  void changeTheme(){
    switch(mainProvider.theme){
      case CustomTheme.light:
        mainProvider.setTheme(CustomTheme.dark);
        break;
      case CustomTheme.dark:
        mainProvider.setTheme(CustomTheme.light);
        break;
    }
  }

  Widget getIconByTheme(CustomTheme theme){
    switch(theme){
      case CustomTheme.light:
        return const Icon(Icons.light_mode);
      case CustomTheme.dark:
        return const Icon(Icons.dark_mode);
    }
  }
}
