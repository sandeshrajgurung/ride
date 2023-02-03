import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahara/pages/screens/login_screen.dart';
import 'package:sahara/pages/screens/otp_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  // static String verify = "";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  // var countryCode = "+977";
  // var phone = "";

  void _saveForm() async {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
      // print('ekjfewjfoiewjfioewjf:${countryCode + phone}');
      // await FirebaseAuth.instance.verifyPhoneNumber(
      //   phoneNumber: '${countryCode + phone}',
      //   verificationCompleted: (PhoneAuthCredential credential) {},
      //   verificationFailed: (FirebaseAuthException e) {},
      //   codeSent: (String verificationId, int? resendToken) {
      //     SignupScreen.verify = verificationId;
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => OtpScreen()));
      //   },
      //   codeAutoRetrievalTimeout: (String verificationId) {},
      // );
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
                SizedBox(
                  child: Image.asset(
                    'lib/assets/sahara-logo.png',
                    height: 170,
                    width: 200,
                  ),
                ),
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
                    // onChanged: (value) => phone = value,
                    cursorColor: Theme.of(context).primaryColor,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value != null && value.trim().length < 10) {
                        return 'Enter a valid 10 digit phone number';
                      }

                      return null;
                    },
                    // style: TextStyle(fontSize: 10),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(17),
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
                    child: Text(
                      "Continue",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
                    label: const Text(
                      "Continue with facebook",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
