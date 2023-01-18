import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahara/pages/screens/view_profile_screen.dart';
import 'package:sahara/utils/app_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewProfile()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 42,
                          backgroundColor: Colors.red,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                'https://png.pngtree.com/element_origin_min_pic/17/03/20/59570755b50b18e42aec393f98dde858.jpg'),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sandesh Grg",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              "View profile",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 7,
                  color: Colors.black12,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ACCOUNT",
                        style: TextStyle(fontSize: 16),
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -3),
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        horizontalTitleGap: 5,
                        leading: Icon(Icons.card_membership),
                        title: RichText(
                          text: const TextSpan(
                            text: 'SaharaPrime ',
                            style: TextStyle(
                                fontFamily: 'Biotif',
                                fontSize: 16,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '(Coming Soon!)',
                                  style: TextStyle(
                                      fontFamily: "sans",
                                      fontStyle: FontStyle.italic,
                                      fontSize: 12,
                                      color: Colors.black45)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 7,
                  color: Colors.black12,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "OFFERS",
                        style: TextStyle(fontSize: 16),
                      ),
                      ListTile(
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -3),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Image(
                            height: 25,
                            width: 25,
                            image: NetworkImage(
                                'https://www.ezyeat.net/uploads/6aef6d9e1f6d9d9f3ded8f113dffd64c.png'),
                          ),
                          title: Text("Promo Code")),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -3),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Icon(Icons.group_add),
                          title: Text("Refer & Earn")),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 7,
                  color: Colors.black12,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "SUPPORT & FEEDBACK",
                        style: TextStyle(fontSize: 16),
                      ),
                      ListTile(
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -3),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Icon(Icons.record_voice_over),
                          title: Text("Support")),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -3),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Icon(Icons.forum),
                          title: Text("Feedback")),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 7,
                  color: Colors.black12,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "SETTINGS",
                        style: TextStyle(fontSize: 16),
                      ),
                      ListTile(
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -3),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Icon(Icons.language),
                          title: Text("Change language")),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -3),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Icon(Icons.lock),
                          title: Text("change password")),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 7,
                  color: Colors.black12,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "GENERAL",
                        style: TextStyle(fontSize: 16),
                      ),
                      ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Icon(Icons.apps),
                          title: Text("About Us")),
                      ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Icon(Icons.policy),
                          title: Text("Terms and condition")),
                      ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Icon(Icons.star),
                          title: Text("Rate Sahara")),
                      ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Icon(Icons.facebook_rounded),
                          title: Text("Facebook")),
                      ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Image(
                              height: 22,
                              width: 22,
                              image: NetworkImage(
                                  'https://www.pngfind.com/pngs/m/237-2378905_ig-png-logo-svg-transparent-instagram-logo-png.png')),
                          title: Text("Instagram")),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
