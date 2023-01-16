import 'package:flutter/material.dart';
import 'package:sahara/pages/widgets/carousel_slider.dart';
import 'package:sahara/pages/widgets/services.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEAEA),
      appBar: AppBar(
        elevation: 0,
        title: const Text("sahara"),
        backgroundColor: Color(0xFFEAEAEA),
        actions: [
          IconButton(
            onPressed: () {},
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
            height: 145,
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
                                      fontFamily: 'Biotif',
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "SaharaWallet",
                                  style: TextStyle(
                                      fontFamily: 'Biotif',
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
                                fontFamily: 'Biotif',
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Sandesh Grg',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Biotif',
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
                        fontSize: 20,
                        fontFamily: 'Biotif',
                        color: Colors.black),
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
                          style: TextStyle(fontFamily: 'Biotif'),
                        ),
                        imageAsset: Image.asset('lib/assets/sahara-bike.png'),
                        onTap: () {
                          print("Bike");
                        },
                      ),
                      SaharaServices(
                        text: Text(
                          'Cab',
                          style: TextStyle(fontFamily: 'Biotif'),
                        ),
                        imageAsset: Image.asset('lib/assets/sahara-cab.png'),
                        onTap: () {
                          print("Cab");
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
                      SaharaServices(
                        text: const Text(
                          'Bus',
                          style: TextStyle(fontFamily: 'Biotif'),
                        ),
                        imageAsset: Image.asset(
                          'lib/assets/sahara-bus.png',
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          print("Bus");
                        },
                      ),
                      SaharaServices(
                        text: const Text(
                          'Food',
                          style: TextStyle(fontFamily: 'Biotif'),
                        ),
                        imageAsset: Image.asset('lib/assets/sahara-food.png'),
                        onTap: () {
                          print("Food");
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
                      fontSize: 18,
                      fontFamily: 'Biotif',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //search bar
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on_sharp),
                      suffixIcon: Icon(
                        Icons.search_outlined,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.all(15),
                      hintText: "Search Destination",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: const BorderSide(
                          width: 2.0,
                          color: Colors.grey,
                        ),
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
                      fontSize: 18,
                      fontFamily: 'Biotif',
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
                          fontSize: 18,
                          fontFamily: 'Biotif',
                        ),
                      ),
                      Text(
                        "All",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontFamily: 'Biotif',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //carousel
                  Container(
                    height: 200,
                    color: Colors.grey,
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
