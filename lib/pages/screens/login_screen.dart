import 'package:flutter/material.dart';
import 'package:sahara/pages/bottom_navigation/main_page.dart';
import 'package:sahara/pages/screens/forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool _passwordVisible;

  final GlobalKey<FormState> _formKey = GlobalKey();

  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
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
                RichText(
                  text: TextSpan(
                    text: 'Login\n',
                    style: TextStyle(
                        color:
                            Theme.of(context).textTheme.headlineMedium!.color,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Enter your sahara ID & Password',
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
                        contentPadding: EdgeInsets.all(18),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .color,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        )),
                        errorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2))),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
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
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    labelText: 'password',
                    labelStyle: TextStyle(
                        color: Theme.of(context).textTheme.headlineSmall!.color,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2),
                    ),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
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
                    child: Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword()));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).primaryColor,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
