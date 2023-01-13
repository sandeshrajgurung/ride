import 'package:flutter/material.dart';
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
                  height: 95,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            SizedBox(
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
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 35),
                            child: RichText(
                              text: const TextSpan(
                                text: 'Hello,\n',
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Sandesh Grg',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
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
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SaharaServices(
                        text: Text(
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
                        text: Text(
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
