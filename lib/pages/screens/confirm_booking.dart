import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sahara/pages/bottom_navigation/profile_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ConfirmBooking extends StatefulWidget {
  const ConfirmBooking({super.key});

  @override
  State<ConfirmBooking> createState() => _ConfirmBookingState();
}

class _ConfirmBookingState extends State<ConfirmBooking> {
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
            SlidingUpPanel(
                controller: panelController,
                boxShadow: [BoxShadow(blurRadius: 0)],
                defaultPanelState: PanelState.OPEN,
                maxHeight: MediaQuery.of(context).size.height * 0.60,
                minHeight: MediaQuery.of(context).size.height * 0.06,
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
  bool _value = false;
  var _isToggled = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: widget.controller,
      children: [
        Column(
          children: [
            buildDragHandle(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isToggled = true;
                      });
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: _isToggled ? 2 : 0,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _isToggled ? Colors.black12 : Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                // color: Colors.blue,
                                height: 50,
                                width: 60,
                                child:
                                    Image.asset('lib/assets/sahara-bike.png')),
                            SizedBox(
                              height: 40,
                              // color: Colors.green,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('     Bike',
                                      style: TextStyle(
                                          color: Colors.black38, height: 2.4)),
                                  IconButton(
                                      onPressed: showBottomSheet,
                                      icon: Icon(
                                        Icons.info_outline,
                                        size: 20,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
                            ),
                            Text('Rs.64/-', style: TextStyle(fontSize: 10))
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isToggled = false;
                      });
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: _isToggled ? 0 : 2,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _isToggled ? Colors.white : Colors.black12,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 50,
                                width: 60,
                                child:
                                    Image.asset('lib/assets/sahara-cab.png')),
                            SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('     Cab',
                                      style: TextStyle(
                                          color: Colors.black38, height: 2)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.info_outline,
                                        size: 20,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                text: 'Rs.265/-',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontFamily: 'Biotif',
                                    height: 1.5),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '  Rs.210/-',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontFamily: 'Biotif',
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Distance:1.90 KM"),
                VerticalDivider(
                  thickness: 1,
                  indent: 8,
                  endIndent: 8,
                  color: Colors.black,
                ),
                _isToggled
                    ? Text("  Price:Rs.64/-     ")
                    : Text("  Price:Rs.210/-     ")
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Fixed Price",
              style: TextStyle(fontSize: 18),
            ),
            Switch.adaptive(
                activeColor: Theme.of(context).primaryColor,
                value: _value,
                onChanged: (value) => setState(
                      () => _value = value,
                    )),
            Text(
              "Bargaining",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 18),
            ),
          ],
        ),

        //switch result
        !_value
            ? Visibility(
                visible: false,
                child: Text('data'),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  cursorHeight: 25,
                  cursorColor: Theme.of(context).primaryColor,
                  initialValue: _isToggled ? "64" : "210",
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: "sans"),
                    labelText: 'Adjust booking fare',
                    contentPadding: EdgeInsets.all(20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black38),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Get a ride",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
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
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          ),
        )
      ],
    );
  }

  Widget buildDragHandle() {
    return IconButton(onPressed: togglePanel, icon: Icon(Icons.expand_less));
  }

  void togglePanel() => widget.panelController.isPanelOpen
      ? widget.panelController.close()
      : widget.panelController.open();

  void showBottomSheet() => showModalBottomSheet(
      context: context,
      builder: (context) => Container(
            height: MediaQuery.of(context).size.height * 0.50,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back, color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 75),
                        child: Text(
                          "Pricing info",
                          style: TextStyle(
                              color: Colors.white, fontSize: 16, height: 1.5),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "lib/assets/sahara-bike.png",
                      ),
                      const Text(
                        "Fast & Affordable Bike/Scooty ride.",
                        style: TextStyle(color: Colors.black54),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Vechile Type:',
                                  style: TextStyle(height: 2),
                                ),
                                Text(
                                  'Base Fare:',
                                  style: TextStyle(height: 2),
                                ),
                                Text(
                                  'Per Km Fare:',
                                  style: TextStyle(height: 2),
                                ),
                                Text(
                                  'Estimated cost:',
                                  style: TextStyle(height: 2),
                                ),
                                Text(
                                  'Discount cost:',
                                  style: TextStyle(height: 2),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Bike',
                                  style:
                                      TextStyle(height: 2, fontFamily: 'sans'),
                                ),
                                Text(
                                  'Rs. 30',
                                  style:
                                      TextStyle(height: 2, fontFamily: 'sans'),
                                ),
                                Text(
                                  'Rs. 17',
                                  style:
                                      TextStyle(height: 2, fontFamily: 'sans'),
                                ),
                                Text(
                                  'Rs. 64',
                                  style:
                                      TextStyle(height: 2, fontFamily: 'sans'),
                                ),
                                Text(
                                  'Rs. 0/- Promo code DHUKURE',
                                  style: TextStyle(
                                    height: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "*Estimates fare may Vary",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
}
