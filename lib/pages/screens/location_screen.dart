import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sahara/pages/screens/confirm_booking.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  LatLng destination = const LatLng(27.749050, 85.345463);

  late GoogleMapController mapController;

  LatLng? _currentPosition;
  bool _isLoading = true;

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAmzEdRV2H8OH2iPfnLiBITI0QkkhpavUE",
      PointLatLng(
          _currentPosition?.latitude ?? 0, _currentPosition?.longitude ?? 0),
      PointLatLng(destination.latitude, destination.longitude),
    );
    print(result.points);

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        return polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
    getPolyPoints();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextField(
            style: TextStyle(height: 1.5),
            cursorColor: Theme.of(context).primaryColor,
            cursorHeight: 30,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
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
                  borderSide: BorderSide(color: Colors.transparent, width: 0)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.black12, width: 0)),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : GoogleMap(
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: _currentPosition!,
                    zoom: 16.0,
                  ),
                  polylines: {
                    Polyline(
                      polylineId: PolylineId("route"),
                      points: polylineCoordinates,
                    )
                  },
                  markers: {
                    Marker(
                      markerId: const MarkerId('CurrentLocation'),
                      position: _currentPosition!,
                    ),
                    Marker(
                      markerId: const MarkerId('Destination'),
                      position: destination,
                    ),
                  },
                ),
          DraggableScrollableSheet(
            initialChildSize: 0.31,
            minChildSize: 0,
            maxChildSize: 0.31,
            builder: (BuildContext context, ScrollController scrollController) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 43,
                          width: 43,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back)),
                        ),
                        Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: IconButton(
                                onPressed: () {}, icon: Icon(Icons.gps_fixed)))
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.18,
                    color: Colors.white.withOpacity(0.9),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Golfutar Stop, Golphutar, BudhanilKantha NagarPalika, Kathmandu',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, fontFamily: "sans"),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ConfirmBooking()));
                                },
                                child: Text(
                                  'Confirm Dropoff Location',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
