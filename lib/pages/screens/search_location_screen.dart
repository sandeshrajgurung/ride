import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahara/models/data.dart';
import 'package:sahara/pages/screens/location_screen.dart';

class SearchLocation extends StatefulWidget {
  final String text;
  const SearchLocation({super.key, required this.text});

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  List<Location> locations = allLocations;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back)),
                    Text(
                      '${widget.text.toString()}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
                  child: TextFormField(
                    onChanged: searchBook,
                    style: TextStyle(height: 1.5),
                    cursorColor: Theme.of(context).primaryColor,
                    cursorHeight: 30,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(17),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      suffixIcon: const Icon(Icons.mic, color: Colors.black),
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 14),
                      filled: true,
                      fillColor: Colors.black12,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              BorderSide(color: Colors.black12, width: 0)),
                    ),
                  ),
                ),
                //search options
                Expanded(
                    child: ListView.builder(
                        itemCount: locations.length,
                        itemBuilder: (context, index) {
                          final location = locations[index];
                          return Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LocationScreen()));
                                },
                                horizontalTitleGap: 1,
                                visualDensity: VisualDensity(vertical: -4),
                                leading: Icon(Icons.location_on),
                                title: Text(
                                  location.address,
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                              )
                            ],
                          );
                        })),
                // ListTile(
                //   visualDensity: VisualDensity(vertical: -2),
                //   // contentPadding: EdgeInsets.all(2),
                //   iconColor: Colors.black,
                //   textColor: Colors.black,

                //   leading: SizedBox(
                //       height: double.infinity, child: Icon(Icons.home)),
                //   title: Text(
                //     "Home",
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   ),
                //   subtitle: Text("Add address"),
                //   trailing: SizedBox(
                //     height: double.infinity,
                //     child: IconButton(
                //       onPressed: () {},
                //       icon: Icon(Icons.edit),
                //     ),
                //   ),
                // ),
                // ListTile(
                //   visualDensity: VisualDensity(vertical: -2),
                //   iconColor: Colors.black,
                //   textColor: Colors.black,
                //   leading: SizedBox(
                //       height: double.infinity, child: Icon(Icons.work)),
                //   title: Text(
                //     "Office",
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   ),
                //   subtitle: Text("Add address"),
                //   trailing: SizedBox(
                //     height: double.infinity,
                //     child: IconButton(
                //       onPressed: () {},
                //       icon: Icon(Icons.edit),
                //     ),
                //   ),
                // ),
                // ListTile(
                //   visualDensity: VisualDensity(vertical: -2),
                //   iconColor: Colors.black,
                //   textColor: Colors.black,
                //   leading: SizedBox(
                //       height: double.infinity, child: Icon(Icons.school)),
                //   title: Text(
                //     "College",
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   ),
                //   subtitle: Text("Add address"),
                //   trailing: SizedBox(
                //     height: double.infinity,
                //     child: IconButton(
                //       onPressed: () {},
                //       icon: Icon(Icons.edit),
                //     ),
                //   ),
                // ),
                // ListTile(
                //   visualDensity: VisualDensity(vertical: -2),
                //   iconColor: Colors.black,
                //   textColor: Colors.black,
                //   leading: SizedBox(
                //       height: double.infinity, child: Icon(Icons.favorite)),
                //   title: Text(
                //     "Other",
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   ),
                //   subtitle: Text("Add address"),
                //   trailing: SizedBox(
                //     height: double.infinity,
                //     child: IconButton(
                //       onPressed: () {},
                //       icon: Icon(Icons.edit),
                //     ),
                //   ),
                // ),
                // ListTile(
                //   visualDensity: VisualDensity(vertical: -2),
                //   iconColor: Colors.black,
                //   textColor: Colors.black,
                //   leading: SizedBox(
                //       height: double.infinity, child: Icon(Icons.location_on)),
                //   title: Text(
                //     "Set on map",
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   ),
                //   trailing: SizedBox(
                //     height: double.infinity,
                //     child: IconButton(
                //       onPressed: () {},
                //       icon: Icon(Icons.edit),
                //     ),
                //   ),
                // ),
                // ListTile(
                //   visualDensity: VisualDensity(vertical: -2),
                //   iconColor: Colors.black,
                //   textColor: Colors.black,
                //   leading: SizedBox(
                //       height: double.infinity,
                //       child: Icon(Icons.add_location_alt)),
                //   title: Text(
                //     "Add Missing Place",
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   ),
                //   subtitle: Text("Add address"),
                //   trailing: SizedBox(
                //     height: double.infinity,
                //     child: IconButton(
                //       onPressed: () {},
                //       icon: Icon(Icons.edit),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void searchBook(String query) {
    final suggestions = locations.where((location) {
      final locationName = location.address.toLowerCase();
      final input = query.toLowerCase();

      return locationName.contains(input);
    }).toList();

    setState(() => locations = suggestions);
  }
}
