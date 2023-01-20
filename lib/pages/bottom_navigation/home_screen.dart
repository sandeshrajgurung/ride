import 'package:flutter/material.dart';
import 'package:sahara/pages/bottom_navigation/profile_screen.dart';
import 'package:sahara/pages/screens/notification_screen.dart';
import 'package:sahara/pages/widgets/carousel_slider.dart';
import 'package:sahara/pages/widgets/services.dart';
import 'package:share_plus/share_plus.dart';

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
                    style: TextStyle(fontSize: 20, color: Colors.black),
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
                          style: TextStyle(),
                        ),
                        imageAsset: Image.asset('lib/assets/sahara-bike.png'),
                        onTap: () {
                          print("Bike");
                        },
                      ),
                      SaharaServices(
                        text: Text(
                          'Cab',
                          style: TextStyle(),
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
                          style: TextStyle(),
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
                          style: TextStyle(),
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
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //search bar
                  GestureDetector(
                    onTap: () {},
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
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "All",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
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
                    // child: FeaturedRestaurant(),
                  ),
                  //refer & earn
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Refer & Earn",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://img.freepik.com/premium-vector/refer-friend-flat-design-illustration-with-megaphone-screen-mobile-phone-social-media-marketing-friends-via-banner-background-poster_2175-2239.jpg?w=2000'))),
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
                    height: 20,
                    thickness: 0.75,
                    color: Colors.black12,
                  ),
                  const ListTile(
                    leading: CircleAvatar(
                      radius: 21,
                      backgroundColor: Colors.black54,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://png.pngtree.com/element_origin_min_pic/17/03/20/59570755b50b18e42aec393f98dde858.jpg'),
                      ),
                    ),
                    title: Text(
                      'Sahara Ride Partner',
                    ),
                    subtitle: Text(
                      'Earn money becoming Sahara Rider Partner',
                      style: TextStyle(
                        fontFamily: 'sans',
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 0.75,
                    color: Colors.black12,
                  ),
                  const ListTile(
                    leading: CircleAvatar(
                      radius: 21,
                      backgroundColor: Colors.black54,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://png.pngtree.com/element_origin_min_pic/17/03/20/59570755b50b18e42aec393f98dde858.jpg'),
                      ),
                    ),
                    title: Text('Sahara Restaurant Partner'),
                    subtitle: Text(
                      'Increase your online sale joining SaharaRestro partner',
                      style: TextStyle(
                        fontFamily: 'sans',
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 0.75,
                    color: Colors.black12,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 21,
                      backgroundColor: Colors.black54,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://png.pngtree.com/element_origin_min_pic/17/03/20/59570755b50b18e42aec393f98dde858.jpg'),
                      ),
                    ),
                    title: Text('Sahara Support'),
                    subtitle: Text(
                      'Get Quick resolution on queries related to Sahara',
                      style: TextStyle(
                        fontFamily: 'sans',
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
