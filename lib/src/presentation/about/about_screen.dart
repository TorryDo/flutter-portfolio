import 'package:flutter/material.dart';
import 'package:portfolio/src/presentation/about/about_provider.dart';
import 'package:portfolio/src/presentation/main_provider.dart';
import 'package:portfolio/utils/lib/provider/provider_ext.dart';

import '../../../routes.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  late AboutProvider aboutProvider;
  late MainProvider mainProvider;
  late ColorScheme colorScheme;

  @override
  void didChangeDependencies() {
    aboutProvider = context.provider();
    mainProvider = context.provider();
    colorScheme = Theme.of(context).colorScheme;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: (size.width / 10).ceilToDouble()),
              const Text('Hi, my name is'),
              Text(
                "${aboutProvider.get().fullName}.",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              Text("${aboutProvider.get().shortIntro}.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: colorScheme.onBackground.withOpacity(0.8))),
              const SizedBox(height: 20),
              Text(aboutProvider.get().longIntro),
              SizedBox(height: (size.width / 10).ceilToDouble()),
              OutlinedButton(
                onPressed: () {
                  mainProvider.navigateToRoute(Routes.CONTACT_SCREEN);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: const Text('Get In Touch', style: TextStyle(fontSize: 20)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
