import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sahara/pages/bottom_navigation/home_screen.dart';

class RideCompleted extends StatefulWidget {
  const RideCompleted({super.key});

  @override
  State<RideCompleted> createState() => _RideCompletedState();
}

class _RideCompletedState extends State<RideCompleted> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Center(
                child: Text(
                  "Thanks For taking SaharaRide",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  // color: Colors.lightBlue,
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "user name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircleAvatar(
                        radius: 37,
                        backgroundImage: AssetImage('lib/assets/user.png'),
                      ),
                      Text(
                        "How was your ride?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RatingBar.builder(
                        minRating: 1,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 30,
                        ),
                        onRatingUpdate: (rating) {},
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                height: MediaQuery.of(context).size.height * 0.24,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(18)),
                child: Column(
                  children: [
                    const ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        'Base fare\n0.00 Kilometers',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        "Rs.30\nRs.34",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Colors.white54,
                      thickness: 1.5,
                    ),
                    const ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        'Sub Total\nPromo discount',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        "Rs.64\n-Rs.0",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Colors.white54,
                      thickness: 1.5,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      visualDensity: VisualDensity(vertical: -4),
                      title: Row(
                        children: [
                          const Text(
                            'Net Fare',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 22,
                            width: 60,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.green, width: 1.5),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(
                                  Icons.attach_money,
                                  color: Colors.green,
                                  size: 14,
                                ),
                                Text(
                                  "CASH",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.green),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      trailing: Text(
                        "Rs64",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  // color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Was the SharaPartner wearing SaharaJacket?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.30,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: () {},
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.30,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: () {},
                              child: Text(
                                "No",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
                // color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "What to improve?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ChoiceBtn(
                          text: 'Service',
                          onPressed: () {},
                        ),
                        ChoiceBtn(
                          text: 'Service',
                          onPressed: () {},
                        ),
                        ChoiceBtn(
                          text: 'Service',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ChoiceBtn(
                          text: 'Service',
                          onPressed: () {},
                        ),
                        ChoiceBtn(
                          text: 'Service',
                          onPressed: () {},
                        ),
                        ChoiceBtn(
                          text: 'Service',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Your Feedback is important to us",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      maxLines: 3,
                      cursorHeight: 25,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: EdgeInsets.all(20),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black38),
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black38),
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Theme.of(context).primaryColor),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: Text(
                        "Completed",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class ChoiceBtn extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const ChoiceBtn({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
      width: MediaQuery.of(context).size.width * 0.26,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Colors.black38),
                borderRadius: BorderRadius.circular(20))),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
