import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sahara/pages/screens/about_screen.dart';
import 'package:sahara/pages/screens/feedback_screens.dart';
import 'package:sahara/pages/screens/message_screen.dart';
import 'package:sahara/pages/screens/promo_screen.dart';
import 'package:sahara/pages/screens/view_profile_screen.dart';
import 'package:sahara/pages/widgets/text_field.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "View profile",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
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
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
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
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '(Coming Soon!)',
                                  style: TextStyle(
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
                    children: [
                      Text(
                        "OFFERS",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -3),
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        horizontalTitleGap: 5,
                        leading: const Image(
                          height: 25,
                          width: 25,
                          image: NetworkImage(
                              'https://www.ezyeat.net/uploads/6aef6d9e1f6d9d9f3ded8f113dffd64c.png'),
                        ),
                        title: Text(
                          "Promo Code",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () => Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => PromoScreen())),
                      ),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                          splashColor: Colors.transparent,
                          onTap: () {
                            Share.share('https://asuper.app.link/iw9hV9n3Cwb');
                          },
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -3),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Icon(Icons.group_add),
                          title: Text(
                            "Refer & Earn",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
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
                    children: [
                      Text(
                        "SUPPORT & FEEDBACK",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListTile(
                          onTap: () {
                            supportDialog(context);
                          },
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -3),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Icon(Icons.record_voice_over),
                          title: Text(
                            "Support",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                          onTap: () => Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => FeedbackScreen())),
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -3),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Icon(Icons.forum),
                          title: Text(
                            "Feedback",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
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
                    children: [
                      Text(
                        "SETTINGS",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -3),
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        horizontalTitleGap: 5,
                        leading: Icon(Icons.language),
                        title: Text(
                          "Change language",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () => _languageDiaogue(context),
                      ),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -3),
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        horizontalTitleGap: 5,
                        leading: Icon(Icons.lock),
                        title: Text(
                          "change password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () => _passwordDiaogue(context),
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
                    children: [
                      Text(
                        "GENERAL",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => AboutScreen()));
                        },
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        horizontalTitleGap: 5,
                        leading: Icon(Icons.apps),
                        title: Text(
                          "About Us",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListTile(
                          onTap: () async {
                            final Uri url = Uri.parse(
                                'https://sahararide.com/terms/condition/');
                            if (!await launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            )) {
                              throw 'Could not launch $url';
                            }
                          },
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Icon(Icons.policy),
                          title: Text(
                            "Terms and condition",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      ListTile(
                        onTap: () => Fluttertoast.showToast(
                            msg: 'Rate is completed',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            textColor: Colors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        horizontalTitleGap: 5,
                        leading: Icon(Icons.star),
                        title: Text(
                          "Rate Sahara",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListTile(
                          onTap: () async {
                            final Uri url = Uri.parse(
                                'https://www.facebook.com/SaharaRide.nepal?mibextid=ZbWKwL');
                            if (!await launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            )) {
                              throw 'Could not launch $url';
                            }
                          },
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Icon(Icons.facebook_rounded),
                          title: Text(
                            "Facebook",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      ListTile(
                          onTap: () async {
                            final Uri url = Uri.parse(
                                'https://instagram.com/sahararide.nepal?igshid=YmMyMTA2M2Y=');
                            if (!await launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            )) {
                              throw 'Could not launch $url';
                            }
                          },
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          horizontalTitleGap: 5,
                          leading: Image(
                              height: 22,
                              width: 22,
                              image: NetworkImage(
                                  'https://www.pngfind.com/pngs/m/237-2378905_ig-png-logo-svg-transparent-instagram-logo-png.png')),
                          title: Text(
                            "Instagram",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
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

supportDialog(BuildContext context) {
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    titlePadding: EdgeInsets.all(0),
    contentPadding: EdgeInsets.all(0),
    title: ListTile(
      tileColor: Theme.of(context).primaryColor,
      title: Text(
        'Support',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            color: Colors.white,
          )),
    ),
    content: SizedBox(
      height: 250,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(
              "9803802177",
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Uri phoneno = Uri.parse('tel:9803802177');
              launchUrl(phoneno);
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(
              "9845285177",
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Uri phoneno = Uri.parse('tel:9845285177');
              launchUrl(phoneno);
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text(
              "Direct Message",
              style: TextStyle(fontSize: 14),
            ),
            onTap: () => Navigator.push((context),
                MaterialPageRoute(builder: (context) => MessageScreen())),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text(
              "support@asuperapp.com",
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Uri email = Uri.parse('mailto:support@asuperapp.com');
              launchUrl(email);
            },
          ),
        ],
      ),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

//Alert dialogue for language
_languageDiaogue(BuildContext context) {
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0)),
    ),
    titlePadding: EdgeInsets.all(0),
    contentPadding: EdgeInsets.all(0),
    title: ListTile(
      tileColor: Theme.of(context).primaryColor,
      title: Text(
        'Select Language',
        style: TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            color: Colors.white,
          )),
    ),
    content: Container(
      height: MediaQuery.of(context).size.height * 0.20,
      child: Column(
        children: [
          ListTile(
            title: Text(
              "English",
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: Text(
              "नेपाली",
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {},
          ),
        ],
      ),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

//Alert dialogue for password
_passwordDiaogue(BuildContext context) {
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    insetPadding: EdgeInsets.zero,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0)),
    ),
    titlePadding: EdgeInsets.all(0),
    contentPadding: EdgeInsets.all(15),
    title: ListTile(
      tileColor: Theme.of(context).primaryColor,
      title: Text(
        'Change Password',
        style: TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          )),
    ),
    content: Container(
      height: MediaQuery.of(context).size.height * 0.41,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          PasswordField(label: 'Old PassWord'),
          PasswordField(label: 'New PassWord'),
          PasswordField(label: 'Confirm PassWord'),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
              child: Text("RESET PASSWORD"))
        ],
      ),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
