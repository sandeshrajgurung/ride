import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sahara/pages/bottom_navigation/profile_screen.dart';
import 'package:sahara/pages/screens/search_location_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BikeRide extends StatefulWidget {
  const BikeRide({super.key});

  @override
  State<BikeRide> createState() => _BikeRideState();
}

class _BikeRideState extends State<BikeRide> {
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
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

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
  }

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
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: true,
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _currentPosition!,
                      zoom: 16.0,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId('value'),
                        position: _currentPosition!,
                      )
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
                )),
            //location icon
            Positioned(right: 15, bottom: height, child: LocationButton()),
            SlidingUpPanel(
                boxShadow: [BoxShadow(blurRadius: 0)],
                defaultPanelState: PanelState.OPEN,
                maxHeight: MediaQuery.of(context).size.height * 0.25,
                minHeight: MediaQuery.of(context).size.height * 0.0,
                onPanelSlide: (position) => setState(() {
                      final panelMaxScrollExtent =
                          heightClosed - height + heightClosed;

                      height = position * panelMaxScrollExtent;
                    }),
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                panelBuilder: (controller) =>
                    PanelWidget(controller: controller)),
],
        ),
      ),
    );
  }
}

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: Colors.white,
      child: Icon(
        Icons.gps_fixed,
        color: Colors.black,
      ),
      onPressed: () {},
    );
  }
}

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  const PanelWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SearchLocation(text: 'Confirm pickup location')));
            },
            child: TextFormField(
              enabled: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                prefixIcon: Icon(Icons.person_pin_circle_sharp),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.black38,
                ),
                labelText: 'Pickup Location',
                hintStyle: TextStyle(color: Colors.grey),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black38,
                      width: 2,
                    )),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SearchLocation(text: 'Confirm dropoff location')));
            },
            child: TextFormField(
              enabled: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                suffixIcon: Icon(Icons.search),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    child: Icon(
                      Icons.location_on_sharp,
                      size: 17,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle),
                  ),
                ),
                labelText: 'Search Dropoff location',
                hintStyle: TextStyle(color: Colors.grey),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black38,
                      width: 2,
                    )),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  final Widget icon;
  final String text;
  const SearchBar({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            (context),
            MaterialPageRoute(
                builder: (context) => SearchLocation(
                      text: 'Confirm pickup location',
                    )));
      },
      child: TextFormField(
        enabled: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          prefixIcon: icon,
          suffixIcon: Icon(
            Icons.search,
            color: Colors.black38,
          ),
          labelText: text,
          hintStyle: TextStyle(color: Colors.grey),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.black38,
                width: 2,
              )),
        ),
      ),
    );
  }
}
