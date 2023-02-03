// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:sahara/pages/bottom_navigation/home_screen.dart';
// import 'package:sahara/pages/screens/signup_screen.dart';

// class OtpScreen extends StatefulWidget {
//   const OtpScreen({super.key});

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   final GlobalKey<FormState> _formKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     var code = "";
//     return Scaffold(
//       body: SafeArea(
//           child: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(Icons.arrow_back_outlined)),
//             const SizedBox(
//               height: 30,
//             ),
//             Text(
//               "OTP",
//               style: TextStyle(
//                   color: Theme.of(context).textTheme.headlineMedium!.color,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold),
//             ),
//             Text(
//               "Enter the OTP number",
//               style: TextStyle(
//                   color: Theme.of(context).textTheme.headlineSmall!.color,
//                   fontSize: 16),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             //Phone number Input field
//             Form(
//               key: _formKey,
//               child: TextFormField(
//                 onChanged: (value) {
//                   code = value;
//                 },
//                 cursorColor: Theme.of(context).primaryColor,
//                 keyboardType: TextInputType.phone,
//                 validator: (value) {
//                   if (value != null && value.trim().length < 10) {
//                     return 'Enter a valid 10 digit phone number';
//                   }

//                   return null;
//                 },
//                 decoration: InputDecoration(
//                     contentPadding: EdgeInsets.all(17),
//                     labelText: 'OTP Number',
//                     labelStyle: TextStyle(
//                         color: Theme.of(context).textTheme.headlineSmall!.color,
//                         fontSize: 14),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Theme.of(context).primaryColor, width: 2),
//                     ),
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                       color: Theme.of(context).primaryColor,
//                     )),
//                     errorBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red, width: 5))),
//               ),
//             ),
//             const SizedBox(
//               height: 25,
//             ),
//             //Proceed button
//             SizedBox(
//               width: double.infinity,
//               height: 45,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(7),
//                   ),
//                   backgroundColor: Theme.of(context).primaryColor,
//                 ),
//                 onPressed: () async {
//                   try {
//                     PhoneAuthCredential credential =
//                         PhoneAuthProvider.credential(
//                             verificationId: SignupScreen.verify, smsCode: code);

//                     // Sign the user in (or link) with the credential
//                     await auth.signInWithCredential(credential);
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => HomeScreen()));
//                   } catch (e) {
//                     print("Wrong Otpppppp");
//                   }
//                 },
//                 child: Text("Continue"),
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
