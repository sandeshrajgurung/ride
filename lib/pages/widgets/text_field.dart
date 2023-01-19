import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String label;
  const PasswordField({super.key, required this.label});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late bool _passwordVisible;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        cursorColor: Theme.of(context).primaryColor,
        obscureText: !_passwordVisible,
        enableSuggestions: false,
        autocorrect: false,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'enter_your_password';
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(18),
          suffixIcon: IconButton(
            icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          labelText: widget.label,
          labelStyle: TextStyle(
              color: Theme.of(context).textTheme.headlineSmall!.color,
              fontSize: 14),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
        ),
      ),
    );
  }
}
