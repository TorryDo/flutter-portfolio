import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:portfolio/common/utils/framework/navigation_ext.dart';
import 'package:portfolio/routes.dart';
import 'package:portfolio/src/presentation/about/about_screen.dart';
import 'package:portfolio/src/presentation/app_navigator.dart';
import 'package:portfolio/src/presentation/contact/contact_screen.dart';
import 'package:portfolio/src/presentation/experience/experience_screen.dart';
import 'package:portfolio/src/presentation/project/project_screen.dart';
import 'package:portfolio/src/presentation/skill/skill_screen.dart';
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
  bool showTrailing = false;
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
          AppNavigator(),
          SizedBox(
            width: 100,
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
              trailing: showTrailing
                  ? IconButton(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      icon: const Icon(Icons.more_horiz_rounded),
                    )
                  : const SizedBox(),
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
                  icon: Icon(Icons.link_outlined),
                  selectedIcon: Icon(Icons.link),
                  label: Text('Experiences'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.phone_iphone),
                  selectedIcon: Icon(Icons.phone_iphone),
                  label: Text('Contact'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    mainProvider.route = routeNames[index];
  }
}
