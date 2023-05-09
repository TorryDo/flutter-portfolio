import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  late ColorScheme colorScheme;

  @override
  void didChangeDependencies() {
    colorScheme = Theme.of(context).colorScheme;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: colorScheme.primaryContainer.withOpacity(0.3)
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: _oneLineTextField(
                      hintText: 'Your Name', isRequired: true),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 1,
                  child: _oneLineTextField(hintText: 'Email', isRequired: true),
                )
              ],
            ),
            const SizedBox(height: 10),
            _oneLineTextField(hintText: 'Subject', isRequired: true),
            const SizedBox(height: 10),
            _multipleLineTextField(hintText: "Describe your awesome idea here"),
            const SizedBox(height: 30),
            _submitButton('Send'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  final textFieldBackgroundOpacity = 0.7;

  Widget _oneLineTextField({
    String hintText = "",
    bool isRequired = false,
  }) {
    return TextField(
      // controller: controller,
      decoration: InputDecoration(
        labelText: () {
          var rs = hintText;
          if (isRequired) {
            rs += " (*)";
          }
          return rs;
        }(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: true,
        fillColor: colorScheme.background.withOpacity(textFieldBackgroundOpacity),
      ),
    );
  }

  Widget _multipleLineTextField({
    String hintText = "",
    bool isRequired = false,
  }) {
    return TextField(
      // controller: controller,
      decoration: InputDecoration(
        labelText: () {
          var rs = hintText;
          if (isRequired) {
            rs += " (*)";
          }
          return rs;
        }(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: true,
        fillColor: colorScheme.background.withOpacity(textFieldBackgroundOpacity),
        alignLabelWithHint: true,
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      minLines: 5,
    );
  }

  Widget _submitButton(String text, {Function()? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(colorScheme.primaryContainer),
        elevation: MaterialStateProperty.all(2.0),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
