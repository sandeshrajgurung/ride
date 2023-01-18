import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String radioButtonItem = 'Male';

  // Group Value for Radio Button.
  int id = 1;
  // String gender = "male";
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
        title: const Text("Profile Update"),
      ),
      body: ListView(padding: EdgeInsets.all(15), children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    print("Photooo add");
                  },
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.black38,
                        child: CircleAvatar(
                          radius: 53,
                          backgroundImage: NetworkImage(
                              'https://png.pngtree.com/element_origin_min_pic/17/03/20/59570755b50b18e42aec393f98dde858.jpg'),
                        ),
                      ),
                      Icon(Icons.add_a_photo)
                    ],
                  ),
                ),
              ),
            ),
            EditTxt(
              label: 'Legal Full Name',
              value: 'User name',
            ),
            EditTxt(
              label: 'Email Address',
              value: 'user@gmail.com',
            ),
            EditTxt(
              label: 'Date of Birth',
              value: '06/01/02',
            ),
            EditTxt(
              label: 'Emergency Contact',
              value: '2151155',
            ),
            Text(
              "Select your gender",
              style: TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  // activeColor: Theme.of(context).primaryColor,
                  value: 1,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      radioButtonItem = 'Male';
                      id = 1;
                    });
                  },
                ),
                Text(
                  'Male',
                  style: new TextStyle(fontSize: 14.0),
                ),
                Radio(
                  value: 2,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      radioButtonItem = 'Female';
                      id = 2;
                    });
                  },
                ),
                Text(
                  'Female',
                  style: new TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Radio(
                  value: 3,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      radioButtonItem = 'Others';
                      id = 3;
                    });
                  },
                ),
                Text(
                  'Others',
                  style: new TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ],
        ),
      ]),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: BottomAppBar(
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
                  child: Text("Update")),
            )),
      ),
    );
  }
}

class EditTxt extends StatelessWidget {
  final String label;
  final String value;

  const EditTxt({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: TextFormField(
        initialValue: value,
        style: TextStyle(fontSize: 14),
        enabled: true,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: label,
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          contentPadding: EdgeInsets.all(17),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black38),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 1.5, color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
