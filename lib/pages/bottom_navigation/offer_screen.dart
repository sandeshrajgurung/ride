import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 2.5,
          bottom: TabBar(
              labelPadding: EdgeInsets.all(8),
              labelColor: Theme.of(context).primaryColor,
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 2.75,
              tabs: const [
                Text(
                  'HOW TO?',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text('OFFERS', style: TextStyle(fontWeight: FontWeight.w600)),
              ]),
        ),
        body: TabBarView(children: [
          _HowToTab(),
          _OfferTab(),
        ]),
      ),
    );
  }
}

class _HowToTab extends StatelessWidget {
  const _HowToTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 165.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'http://api.sahararide.com/media/image/blogs/Screen_Shot_2022-12-07_at_15.53.43.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "How to Apply Promo Code",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Hello Everyone! Here's an easy way to apply a promo code for your Sahara ride! Ride fast, Ride safe, Ride cheaper!",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7))),
                      onPressed: () async {
                        final Uri url = Uri.parse(
                            'https://youtube.com/shorts/e-2Cq0W5TiM?feature=share');
                        if (!await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        )) {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text(
                        "WATCH NOW",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              Divider(
                thickness: 1.0,
              ),
              Container(
                height: 165.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'http://api.sahararide.com/media/image/blogs/Screen_Shot_2022-12-07_at_15.53.43.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Book Without Internet Connection!!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "You can Book SaharaRide without internet connection: OPen Sahara when you have No Internet. A Dialog Box will open Fill up everything and Press Book, A message box will open in your phone just send the message You will recieve a confirmation call for booking ",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7))),
                      onPressed: () async {
                        final Uri url =
                            Uri.parse('https://fb.watch/iacL7TVyHl/');
                        if (!await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        )) {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text(
                        "WATCH NOW",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              Divider(
                thickness: 1.0,
              ),
              Container(
                height: 165.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'http://api.sahararide.com/media/image/blogs/Screen_Shot_2022-12-07_at_15.53.43.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Booking for others !!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "There are two ways you can book SaharaRide. You can get ride for yourself or you can get ride for others from your Sahara Before you Confirm your Ride: Choose Booking for Others then Enter the name and Phone Number of the person you are booking for.",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7))),
                      onPressed: () async {
                        final Uri url =
                            Uri.parse('https://fb.watch/iacNbxkZLi/');
                        if (!await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        )) {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text(
                        "WATCH NOW",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              Divider(
                thickness: 1.0,
              ),
              Container(
                height: 165.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'http://api.sahararide.com/media/image/blogs/Screen_Shot_2022-12-07_at_15.53.43.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "How to take a Sahara Ride?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Watch this video to know how to take Sahara Ride in simple 3 steps.",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7))),
                      onPressed: () async {
                        final Uri url =
                            Uri.parse('https://fb.watch/iacOyBRnd6/');
                        if (!await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        )) {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text(
                        "WATCH NOW",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              Divider(
                thickness: 1.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}

//_OfferTab
class _OfferTab extends StatefulWidget {
  const _OfferTab({super.key});

  @override
  State<_OfferTab> createState() => __OfferTabState();
}

class __OfferTabState extends State<_OfferTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 165.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'http://api.sahararide.com/media/image/blogs/Screen_Shot_2022-12-07_at_15.53.43.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Ride and Win Offer !!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Take 15 rides from Sahara & Get a chance to win Rs5000 dinner voucher from Grills & Bakes family restaurant",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7))),
                      onPressed: () {},
                      child: Text(
                        "WATCH NOW",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              Divider(
                thickness: 1.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
