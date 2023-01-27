import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahara/pages/screens/edit_profile_screen.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
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
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: const [
                Icon(
                  Icons.power_settings_new,
                  color: Colors.white,
                ),
                Text(
                  "Logout",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.red,
                  child: CircleAvatar(
                    radius: 53,
                    backgroundImage: NetworkImage(
                        'https://png.pngtree.com/element_origin_min_pic/17/03/20/59570755b50b18e42aec393f98dde858.jpg'),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TxtField(label: 'Legal Full Name', labelField: 'User'),
              TxtField(label: 'Email', labelField: 'User@gmail.com'),
              TxtField(label: 'Phone Number', labelField: '9821354684'),
              TxtField(label: 'Date of Birth', labelField: '04/14/02'),
              TxtField(label: 'Emergency Contact', labelField: 'N/A'),
              TxtField(label: 'Gender', labelField: 'Male'),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          height: 65,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            color: Colors.white,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 0,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
                child: Text("Edit")),
          )),
    );
  }
}

class TxtField extends StatelessWidget {
  String label;
  String labelField;

  TxtField({super.key, required this.label, required this.labelField});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            enabled: false,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(18),
                disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(width: 2, color: Colors.black38),
                ),
                label: Text(
                  labelField,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
