import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sahara/pages/bottom_navigation/profile_screen.dart';

class BikeRide extends StatefulWidget {
  const BikeRide({super.key});

  @override
  State<BikeRide> createState() => _BikeRideState();
}

class _BikeRideState extends State<BikeRide> {
  final LatLng currentLocation = LatLng(27.73, 85.34);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: currentLocation, zoom: 14),
              markers: {
                Marker(markerId: MarkerId("source"), position: currentLocation)
              },
            ),
            Positioned(
                top: 50,
                left: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.grid_view_sharp,
                    size: 35,
                    color: Theme.of(context).primaryColor,
                  ),
                )),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.30,
                right: 5,
                child: SpeedDial(
                  icon: Icons.add,
                  spaceBetweenChildren: 10,
                  overlayOpacity: 0,
                  backgroundColor: Colors.red,
                  animatedIcon: AnimatedIcons.menu_close,
                  children: [
                    SpeedDialChild(
                      onTap: () {},
                      labelBackgroundColor: Theme.of(context).primaryColor,
                      child: Icon(Icons.refresh),
                      label: 'Refresh',
                    ),
                    SpeedDialChild(
                      onTap: () => supportDialog(context),
                      labelBackgroundColor: Theme.of(context).primaryColor,
                      child: Icon(Icons.record_voice_over),
                      label: 'Support',
                    ),
                  ],
                )),
          ],
        ),
        // bottomSheet: Container(
        //   height: 100,
        //   color: Colors.red,
        //   child: Column(
        //     children: [
        //       GestureDetector(
        //         onTap: () {},
        //         child: Container(
        //           padding: EdgeInsets.all(10),
        //           height: 50,
        //           decoration: BoxDecoration(
        //               border: Border.all(width: 2, color: Colors.black45),
        //               borderRadius: BorderRadius.circular(5)),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Row(
        //                 children: [
        //                   Container(
        //                     height: 20,
        //                     width: 20,
        //                     child: Icon(
        //                       Icons.location_on_sharp,
        //                       size: 16,
        //                       color: Colors.white,
        //                     ),
        //                     decoration: BoxDecoration(
        //                         color: Theme.of(context).primaryColor,
        //                         shape: BoxShape.circle),
        //                   ),
        //                   SizedBox(
        //                     width: 15,
        //                   ),
        //                   Text(
        //                     "Search Destination",
        //                     style: TextStyle(fontSize: 12, fontFamily: "sans"),
        //                   ),
        //                 ],
        //               ),
        //               Icon(
        //                 Icons.search_outlined,
        //                 color: Colors.grey,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       GestureDetector(
        //         onTap: () {},
        //         child: Container(
        //           padding: EdgeInsets.all(10),
        //           height: 50,
        //           decoration: BoxDecoration(
        //               border: Border.all(width: 2, color: Colors.black45),
        //               borderRadius: BorderRadius.circular(5)),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Row(
        //                 children: [
        //                   Container(
        //                     height: 20,
        //                     width: 20,
        //                     child: Icon(
        //                       Icons.location_on_sharp,
        //                       size: 16,
        //                       color: Colors.white,
        //                     ),
        //                     decoration: BoxDecoration(
        //                         color: Theme.of(context).primaryColor,
        //                         shape: BoxShape.circle),
        //                   ),
        //                   SizedBox(
        //                     width: 15,
        //                   ),
        //                   Text(
        //                     "Search Destination",
        //                     style: TextStyle(fontSize: 12, fontFamily: "sans"),
        //                   ),
        //                 ],
        //               ),
        //               Icon(
        //                 Icons.search_outlined,
        //                 color: Colors.grey,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
