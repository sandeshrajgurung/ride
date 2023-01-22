import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahara/models/data.dart';

class FeaturedRestaurants extends StatefulWidget {
  const FeaturedRestaurants({super.key});

  @override
  State<FeaturedRestaurants> createState() => _FeaturedRestaurantsState();
}

class _FeaturedRestaurantsState extends State<FeaturedRestaurants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Featured Restaurants"),
      ),
      body: ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            final Restaurant restaurant;
            restaurant = restaurants[index];
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(restaurant.imageUrl))),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restaurant.name,
                                style: TextStyle(
                                    fontSize: 18,
                                    height: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Text(
                                restaurant.address,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                restaurant.type,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                "Delivery hours ${restaurant.deliveryHours}",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                  )
                ],
              ),
            );
          }),
    );
  }
}
