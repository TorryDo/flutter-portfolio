import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:portfolio/src/presentation/contact/contact_form.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late ColorScheme colorScheme;

  @override
  void didChangeDependencies() {
    colorScheme = Theme.of(context).colorScheme;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Let's build Fancy stuffs together",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
            const SizedBox(height: 10),
            _socialButtons(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: ContactForm(),
            )
          ],
        ),
      ),
    );
  }

  Widget _socialButtons() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _socialButton(FontAwesomeIcons.facebook),
          const SizedBox(width: 20),
          _socialButton(FontAwesomeIcons.github),
          const SizedBox(width: 20),
          _socialButton(FontAwesomeIcons.linkedin),
        ],
      ),
    );
  }

  Widget _socialButton(IconData iconData, {double size = 50, Function()? onPressed }){
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: colorScheme.primaryContainer
        ),
        child: Icon(iconData),
      ),
    );
  }
}
