import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sahara/pages/bottom_navigation/profile_screen.dart';
import 'package:sahara/pages/screens/search_location_screen.dart';
import 'package:sahara/pages/screens/searching_rider_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ConfirmBooking extends StatefulWidget {
  const ConfirmBooking({super.key});

  @override
  State<ConfirmBooking> createState() => _ConfirmBookingState();
}

class _ConfirmBookingState extends State<ConfirmBooking> {
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
                            title: 'Golfutar Stop, Golphutar',
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
  bool _isToggled = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: widget.controller,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
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
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:
                                _isToggled ? Color(0xFFEAEAEA) : Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                // color: Colors.blue,
                                height: 50,
                                width: 60,
                                child: Image.asset(
                                  'lib/assets/sahara-bike.png',
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              height: 30,
                              width: double.infinity,
                              // color: Colors.green,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // const Padding(
                                  //     padding: EdgeInsets.only(left: 30)),
                                  const Text('Bike',
                                      style: TextStyle(
                                        color: Color(0xFF5F5F5F),
                                        fontWeight: FontWeight.bold,
                                      )),
                                  _isToggled
                                      ? IconButton(
                                          padding: EdgeInsets.zero,
                                          visualDensity: VisualDensity(
                                              horizontal:
                                                  VisualDensity.minimumDensity),
                                          onPressed: showBottomSheet,
                                          icon: const Icon(
                                            Icons.info_outline,
                                            size: 20,
                                            color: Colors.red,
                                          ))
                                      : const Visibility(
                                          visible: false, child: Text("dasj"))
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Rs.64/-',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  )),
                            )
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
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _isToggled ? Colors.white : Color(0xFFEAEAEA),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 50,
                                width: 60,
                                child: Image.asset(
                                  'lib/assets/sahara-cab.png',
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('     Cab',
                                      style: TextStyle(
                                        color: Color(0xFF5F5F5F),
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Visibility(
                                    visible: _isToggled ? false : true,
                                    child: IconButton(
                                        padding: EdgeInsets.zero,
                                        visualDensity: const VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity),
                                        onPressed: showBottomSheet,
                                        icon: const Icon(
                                          Icons.info_outline,
                                          size: 20,
                                          color: Colors.red,
                                        )),
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('  Rs.210/-',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                    fontSize: 10,
                                    color: Colors.black,
                                  )),
                            ),
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
          padding:
              const EdgeInsets.only(top: 15.0, left: 15, right: 15, bottom: 10),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Distance:1.90 KM",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const VerticalDivider(
                  thickness: 1,
                  indent: 8,
                  endIndent: 8,
                  color: Colors.black,
                ),
                _isToggled
                    ? const Text(
                        "  Price:Rs.64/-     ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    : const Text(
                        "  Price:Rs.210/-     ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Fixed Price",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
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
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
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
                      borderSide:
                          BorderSide(width: 2, color: Color(0xFFEAEAEA)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
        SizedBox(
          height: 8,
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
                onPressed: () => _confirmDialog(context),
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => AcceptRide()));

                child: Text(
                  "Get a ride",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
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
                        style: TextStyle(color: Color(0xFF5F5F5F)),
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

_confirmDialog(BuildContext context) {
  String booking = "self";
  bool textFieldVisible = false;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        void bookingSelection(value) {
          setState(() {
            booking = value;
            textFieldVisible = value == "others";
          });
        }

        return AlertDialog(
          insetPadding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Select payment type",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    "Confirm your ride?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: MediaQuery.of(context).size.width * 0.20,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.account_balance_wallet,
                            size: 40,
                          ),
                          Text(
                            "Wallet",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: MediaQuery.of(context).size.width * 0.18,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.account_balance_wallet,
                            size: 40,
                          ),
                          Text(
                            "Cash",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Radio(
                              activeColor: Theme.of(context).primaryColor,
                              visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity),
                              value: "self",
                              groupValue: booking,
                              onChanged: bookingSelection,
                            ),
                            const Text(
                              "Booking for self",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              activeColor: Theme.of(context).primaryColor,
                              visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity),
                              value: "others",
                              groupValue: booking,
                              onChanged: bookingSelection,
                            ),
                            const Text(
                              "Booking for self",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              if (textFieldVisible)
                Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          label: Text("Name"),
                          labelStyle:
                              TextStyle(color: Color(0xFF5F5F5F), fontSize: 12),
                          floatingLabelStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5, color: Color(0xFF5F5F5F))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5,
                                  color: Theme.of(context).primaryColor))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          label: Text("Phone Number"),
                          labelStyle:
                              TextStyle(color: Color(0xFF5F5F5F), fontSize: 12),
                          floatingLabelStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5, color: Color(0xFF5F5F5F))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5,
                                  color: Theme.of(context).primaryColor))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.32,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0, backgroundColor: Colors.black),
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.30,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Theme.of(context).primaryColor),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchingRider())),
                        child: const Text(
                          "Confirm",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        )),
                  )
                ],
              ),
            ],
          ),
        );
      });
    },
  );
}
