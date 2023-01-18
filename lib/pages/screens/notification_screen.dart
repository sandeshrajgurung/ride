import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahara/models/data.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).primaryColor,
            statusBarIconBrightness: Brightness.light,
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Notification"),
          actions: [
            IconButton(
              onPressed: () {
                showAlertDialog(context);
              },
              icon: Icon(Icons.delete),
              color: Colors.white,
            )
          ],
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item;
            item = items[index];
            print(item.title);
            return Column(
              children: [
                ListTile(
                  textColor: Colors.white,
                  minVerticalPadding: 5,
                  visualDensity: VisualDensity(vertical: -3),
                  tileColor: Colors.black54,
                  leading: Text(item.date),
                  title: Text(item.day),
                  subtitle: Text(item.time),
                  trailing: Text(item.timeAgo),
                ),
                const Divider(
                  height: 0,
                  thickness: 3,
                  color: Colors.white60,
                ),
                ListTile(
                  tileColor: Colors.white70,
                  leading: Icon(
                    Icons.notifications,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 18),
                  ),
                  subtitle: Text(item.desc),
                )
              ],
            );
          },
        ));
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget noButton = TextButton(
    child: Text(
      "NO,THANKS",
      style: TextStyle(color: Theme.of(context).primaryColor),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget okButton = TextButton(
    child: Text(
      "OKAY",
      style: TextStyle(color: Theme.of(context).primaryColor),
    ),
    onPressed: () {},
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text(
      "Clear All Notification",
      style: TextStyle(fontFamily: "sans"),
    ),
    content: const Text(
      "Are You sure you want to clear all notifications?",
      style: TextStyle(fontFamily: "sans", color: Colors.black38),
    ),
    actions: [
      noButton,
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
