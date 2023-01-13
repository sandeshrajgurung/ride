import 'package:flutter/material.dart';
import 'package:sahara/pages/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Namaste\n',
                    style: TextStyle(
                        color:
                            Theme.of(context).textTheme.headlineMedium!.color,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'From Sahara App',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .color,
                              fontSize: 16)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
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
                    // style: TextStyle(fontSize: 10),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(17),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .color,
                            fontSize: 14),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        errorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5))),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: _saveForm,
                    child: Text("Continue"),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      backgroundColor: Color(0xFF1877F2),
                    ),
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: Theme.of(context).primaryColor,
                    // ),
                    onPressed: () {},
                    icon: const Icon(Icons.facebook_rounded),
                    label: const Text("Continue with facebook"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
