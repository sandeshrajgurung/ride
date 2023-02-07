import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sahara/pages/bottom_navigation/profile_screen.dart';
import 'package:sahara/pages/screens/picked_screen.dart';
import 'package:sahara/pages/screens/search_location_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SearchingRider extends StatefulWidget {
  const SearchingRider({super.key});

  @override
  State<SearchingRider> createState() => _SearchingRiderState();
}

class _SearchingRiderState extends State<SearchingRider> {
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
                maxHeight: MediaQuery.of(context).size.height * 0.37,
                minHeight: MediaQuery.of(context).size.height * 0.28,
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
            "Searching for SaharaPartner",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, height: 1.5),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: LinearProgressIndicator(
              minHeight: 2,
              backgroundColor: Colors.red,
              color: Color.fromARGB(255, 252, 203, 220),
            ),
          ),
          const Text(
            "Please be patience we are arranging a SaharaPartner for you!Thankyou!",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
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
            height: MediaQuery.of(context).size.height * 0.02,
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
                onPressed: () => _cancelDialog(context),
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

_cancelDialog(BuildContext context) {
  String? reason;
  bool textFieldVisible = false;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        void handleSelection(value) {
          setState(() {
            reason = value;
            textFieldVisible = value == "Other";
          });
        }

        return AlertDialog(
          insetPadding: EdgeInsets.all(15),
          contentPadding: EdgeInsets.zero,
          content: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            // height: MediaQuery.of(context).size.height * 0.47,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text(
                    "Cancellation Reason",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      return Navigator.pop(context);
                    },
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 2,
                ),
                RadioListTile(
                  activeColor: Theme.of(context).primaryColor,
                  visualDensity: VisualDensity(vertical: -2),
                  title: Text("My pickup/destination location was incorrect"),
                  value: "incorrect locatin",
                  controlAffinity: ListTileControlAffinity.trailing,
                  groupValue: reason,
                  onChanged: handleSelection,
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                ),
                RadioListTile(
                  activeColor: Theme.of(context).primaryColor,
                  visualDensity: VisualDensity(vertical: -2),
                  title: const Text(
                    "Rider/Partner asked me to cancel",
                  ),
                  value: "Rider",
                  controlAffinity: ListTileControlAffinity.trailing,
                  groupValue: reason,
                  onChanged: handleSelection,
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                ),
                RadioListTile(
                  activeColor: Theme.of(context).primaryColor,
                  visualDensity: VisualDensity(vertical: -2),
                  title: const Text("I waited too long"),
                  value: "waiting",
                  controlAffinity: ListTileControlAffinity.trailing,
                  groupValue: reason,
                  onChanged: handleSelection,
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                ),
                RadioListTile(
                  activeColor: Theme.of(context).primaryColor,
                  visualDensity: VisualDensity(vertical: -2),
                  title: const Text("Other"),
                  value: "Other",
                  controlAffinity: ListTileControlAffinity.trailing,
                  groupValue: reason,
                  onChanged: handleSelection,
                ),
                if (textFieldVisible)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Give a short cancellation reason...',
                      ),
                    ),
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15, bottom: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          return Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel Ride",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}
