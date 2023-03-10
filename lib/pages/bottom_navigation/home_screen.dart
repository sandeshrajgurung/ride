import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sahara/pages/bottom_navigation/profile_screen.dart';
import 'package:sahara/pages/screens/bike_screen.dart';
import 'package:sahara/pages/screens/featured_restro.dart';
import 'package:sahara/pages/screens/notification_screen.dart';
import 'package:sahara/pages/screens/search_location_screen.dart';
import 'package:sahara/pages/widgets/carousel_slider.dart';
import 'package:sahara/pages/widgets/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store_redirect/store_redirect.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEAEA),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: Image.asset(
          'lib/assets/sahara-logo.png',
          height: 90,
          width: 110,
        ),
        backgroundColor: Color(0xFFEAEAEA),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationScreen()));
            },
            icon: const Icon(Icons.notifications_outlined),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
                color: Colors.white),
            height: 142,
            //wallet container
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFF30200),
                          Color(0xFFFF6400),
                        ]),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red,
                  ),
                  height: 90,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.account_balance_wallet,
                              color: Colors.green,
                              size: 32,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "NPR.0.00",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "SaharaWallet",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: 'Hello,\n',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Sandesh Grg',
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sahara Services",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SaharaServices(
                        text: Text(
                          'Bike',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        imageAsset: Image.asset('lib/assets/sahara-bike.png'),
                        onTap: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => BikeRide()));
                        },
                      ),
                      SaharaServices(
                        text: Text(
                          'Cab',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        imageAsset: Image.asset('lib/assets/sahara-cab.png'),
                        onTap: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => BikeRide()));
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(alignment: Alignment.center, children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                (context),
                                MaterialPageRoute(
                                    builder: (context) => BikeRide()));
                          },
                          child: Container(
                            width: 150,
                            height: 95,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  )
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: Image.asset(
                                      'lib/assets/bargaining.png',
                                      fit: BoxFit.contain,
                                    )),
                                Container(
                                    padding: EdgeInsets.all(2),
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Text(
                                      "Bargaining",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 55,
                          width: 72,
                          child: Center(
                            child: Lottie.network(
                                'https://lottie.host/58f2ea03-56b9-4ba6-8be8-1b55bde16f40/omX0FgJoJT.json'),
                          ),
                        )
                      ]),
                      SaharaServices(
                        text: const Text(
                          'Food',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        imageAsset: Image.asset('lib/assets/sahara-food.png'),
                        onTap: () {
                          _alertDialog(context);
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Where do you want to go?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //search bar
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchLocation(
                                    text: 'Confirm dropoff location',
                                  )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black45),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                child: Icon(
                                  Icons.location_on_sharp,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Search Destination",
                                style:
                                    TextStyle(fontSize: 12, fontFamily: "sans"),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.search_outlined,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  //whats trending?
                  const Text(
                    "What's Trending",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                'http://api.sahararide.com/media/image/blogs/Screen_Shot_2022-12-07_at_15.53.43.png'))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Featured Restaurant
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Featured Restaurants",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => FeaturedRestaurants()));
                        },
                        child: Text(
                          "All",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //carousel
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                    child: CustomIndicator(),
                  ),
                  //refer & earn
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Refer & Earn",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Image.asset(
                    'lib/assets/refer.png',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'Share ',
                      style: TextStyle(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Sahara',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal)),
                        TextSpan(
                            text:
                                ' with your friends, family, circles and ask them to register in Sahara and take a ride. Both you and your friend will get SaharaWallet balance after the first ride has beeen taken.'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 47,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        Share.share('https://asuper.app.link/iw9hV9n3Cwb');
                      },
                      child: Text("Refer & Earn"),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 0.75,
                    color: Colors.black12,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    onTap: () {
                      StoreRedirect.redirect(
                        androidAppId: 'com.businessgrowthcompany.superapprider',
                        iOSAppId: '1576198596',
                      );
                    },
                    leading: Image.asset(
                      'lib/assets/rider.png',
                      height: 42,
                      width: 42,
                    ),
                    title: const Text(
                      'Sahara Ride Partner',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      'Earn money becoming Sahara Rider Partner',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 5,
                    thickness: 0.75,
                    color: Colors.black12,
                  ),
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    onTap: () {
                      StoreRedirect.redirect(
                        androidAppId:
                            'com.businessgrowthcompany.superrestaurant',
                        iOSAppId: '',
                      );
                    },
                    leading: Image.asset(
                      'lib/assets/restro.png',
                      height: 42,
                      width: 42,
                    ),
                    title: Text(
                      'Sahara Restaurant Partner',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Increase your online sale joining SaharaRestro partner',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 5,
                    thickness: 0.75,
                    color: Colors.black12,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    leading: Image.asset(
                      'lib/assets/support.png',
                      height: 42,
                      width: 42,
                    ),
                    title: Text(
                      'Sahara Support',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Get Quick resolution on queries related to Sahara',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                    onTap: () {
                      supportDialog(context);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

_alertDialog(BuildContext context) {
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    titlePadding: EdgeInsets.all(0),
    contentPadding: EdgeInsets.all(0),
    title: ListTile(
      tileColor: Theme.of(context).primaryColor,
      title: Center(
        child: Text(
          'Service Alert !!!',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    ),
    content: Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(padding: EdgeInsets.all(15)),
          Text(
            "Coming Soon!! Stay Updated!!",
            style: TextStyle(fontSize: 18),
          ),
          TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Ok",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
