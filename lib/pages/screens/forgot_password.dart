import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      print("OTP sent");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_outlined)),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Forgot Password",
              style: TextStyle(
                  color: Theme.of(context).textTheme.headlineMedium!.color,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "we will send OTP code to your phone\nnumber.",
              style: TextStyle(
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 30,
            ),
            //Phone number Input field
            Form(
              key: _formKey,
              child: TextFormField(
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.trim().length < 10) {
                    return 'Enter a valid 10 digit phone number';
                  }

                  return null;
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(17),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                        color: Theme.of(context).textTheme.headlineSmall!.color,
                        fontSize: 14),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    )),
                    errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5))),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //Proceed button
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: _saveForm,
                child: Text("Continue"),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
