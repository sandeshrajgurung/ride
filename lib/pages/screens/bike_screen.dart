import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sahara/pages/bottom_navigation/profile_screen.dart';

class BikeRide extends StatefulWidget {
  const BikeRide({super.key});

  @override
  State<BikeRide> createState() => _BikeRideState();
}

class _BikeRideState extends State<BikeRide> {
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
                        markerId: MarkerId('value'),
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
          ],
        ),
      ),
    );
  }
}
