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
          color: colorScheme.primaryContainer.withOpacity(0.3)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 25, bottom: 20),
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
            const SizedBox(height: 20),
            _multipleLineTextField(hintText: "Message"),
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
        fillColor:
            colorScheme.background.withOpacity(textFieldBackgroundOpacity),
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
        fillColor:
            colorScheme.background.withOpacity(textFieldBackgroundOpacity),
        alignLabelWithHint: true,
      ),
      keyboardType: TextInputType.multiline,
      maxLines: 10,
      minLines: 5,
    );
  }

  Widget _submitButton(String text, {Function()? onPressed}) {
    return SizedBox(
      width: 150,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        focusElevation: 10,
        hoverColor: Colors.blueGrey,
        elevation: 2,
        onPressed: onPressed,
        child: const Text('Submit'),
      ),
    );
  }
}
