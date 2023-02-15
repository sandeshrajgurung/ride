import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sahara/pages/bottom_navigation/profile_screen.dart';
import 'package:sahara/pages/screens/picked_screen.dart';
import 'package:sahara/pages/screens/search_location_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AcceptRide extends StatefulWidget {
  const AcceptRide({super.key});

  @override
  State<AcceptRide> createState() => _AcceptRideState();
}

class _AcceptRideState extends State<AcceptRide> {
  LatLng destination = const LatLng(27.749050, 85.345463);
  static const double heightClosed = 195;
  double height = heightClosed;

  late GoogleMapController mapController;

  LatLng? _currentPosition;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    setState(() {
      _currentPosition = location;
      _isLoading = false;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.showMarkerInfoWindow(MarkerId('value'));
    mapController.showMarkerInfoWindow(MarkerId('Destination'));
  }

  final panelController = PanelController();

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
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : GoogleMap(
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: true,
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _currentPosition!,
                      zoom: 16.0,
                    ),
                    markers: {
                      Marker(
                          markerId: MarkerId('value'),
                          position: _currentPosition!,
                          infoWindow: InfoWindow(
                            title: 'Milijuli Tol, Kathmandu',
                            snippet: 'Tap to edit',
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SearchLocation(
                                        text: 'Confirm pickup location'))),
                          )),
                      Marker(
                          markerId: const MarkerId('Destination'),
                          position: destination,
                          infoWindow: InfoWindow(
                            title: 'Golfutar Stop, Golphutar, kathmandu',
                            snippet: 'Tap to edit',
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SearchLocation(
                                        text: 'Confirm dropoff location'))),
                          )),
                    },
                  ),
            Positioned(
                top: 40,
                left: 10,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    'lib/assets/ic_more_revised.png',
                    height: 55,
                    width: 55,
                  ),
                )),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.30,
                right: 5,
                child: SpeedDial(
                  curve: Curves.bounceIn,
                  spaceBetweenChildren: 10,
                  overlayOpacity: 0,
                  backgroundColor: Colors.white,
                  children: [
                    SpeedDialChild(
                      labelStyle: TextStyle(color: Colors.white),
                      onTap: () {},
                      labelBackgroundColor: Theme.of(context).primaryColor,
                      child: Icon(Icons.refresh),
                      label: 'Refresh',
                    ),
                    SpeedDialChild(
                      labelStyle: TextStyle(color: Colors.white),
                      onTap: () => supportDialog(context),
                      labelBackgroundColor: Theme.of(context).primaryColor,
                      child: Icon(Icons.record_voice_over),
                      label: 'Support',
                    ),
                  ],
                  child: Icon(Icons.add, color: Colors.black),
                  activeIcon: Icons.close,
                  iconTheme: IconThemeData(color: Colors.black),
                  useRotationAnimation: true,
                )),
            SlidingUpPanel(
                controller: panelController,
                boxShadow: [BoxShadow(blurRadius: 0)],
                defaultPanelState: PanelState.CLOSED,
                maxHeight: MediaQuery.of(context).size.height * 0.43,
                minHeight: MediaQuery.of(context).size.height * 0.35,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                panelBuilder: (controller) => PanelWidget(
                    controller: controller, panelController: panelController)),
          ],
        ),
      ),
    );
  }
}

class PanelWidget extends StatefulWidget {
  final ScrollController controller;
  final PanelController panelController;

  const PanelWidget(
      {super.key, required this.controller, required this.panelController});

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 30, child: buildDragHandle()),
          const Text(
            "Accepted",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 2.3,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            height: MediaQuery.of(context).size.height * 0.14,
            // color: Colors.amber,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const /*--Remove const when dynamic*/ CircleAvatar(
                      radius: 41,
                      backgroundColor: Colors.red,
                      child: CircleAvatar(
                        radius: 39,
                        backgroundImage: AssetImage('lib/assets/user.png'),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Column(
                      /* Rider detail colum */
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const /*--Remove const when dynamic*/ [
                        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                        Text(
                          "Rider name",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Bike Color Bike Model",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        ),
                        Text(
                          "Plate no",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.22,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          /*Change When dynamic */
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PickedScreen()));
                        },
                        icon: const Icon(
                          Icons.phone,
                          size: 24,
                        ),
                        label: const Text(
                          "Call",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    const Text(
                      "Chat & Call",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Distance:1.90 KM",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                VerticalDivider(
                  thickness: 1,
                  indent: 8,
                  endIndent: 8,
                  color: Colors.black,
                ),
                Text(
                  "  Price:Rs.64/-     ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.black,
                ),
                onPressed: () {},
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }

  Widget buildDragHandle() {
    return IconButton(onPressed: togglePanel, icon: Icon(Icons.expand_less));
  }

  void togglePanel() => widget.panelController.isPanelOpen
      ? widget.panelController.close()
      : widget.panelController.open();
}
