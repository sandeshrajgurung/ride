import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:sahara/models/data.dart';
import 'package:sahara/pages/screens/confirm_booking.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: DefaultTabController(
              length: 2,
              animationDuration: Duration.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "History",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15),
                      child: ButtonsTabBar(
                          height: MediaQuery.of(context).size.height * 0.06,
                          borderWidth: 2,
                          elevation: 0,
                          borderColor: Theme.of(context).primaryColor,
                          unselectedBorderColor: Colors.black38,
                          unselectedDecoration:
                              BoxDecoration(color: Colors.transparent),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 32,
                          ),
                          backgroundColor: Colors.red,
                          tabs: [
                            Tab(
                              text: "Ride",
                            ),
                            Tab(
                              text: "Food",
                            )
                          ]),
                    ),
                    Divider(
                      color: Colors.black12,
                      thickness: 8,
                    ),
                    Expanded(
                        child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [_RideScreen(), _FoodScreen()]))
                  ],
                ),
              ))),
    );
  }
}

//Ride screen
class _RideScreen extends StatefulWidget {
  const _RideScreen({
    super.key,
  });

  @override
  State<_RideScreen> createState() => __RideScreenState();
}

class __RideScreenState extends State<_RideScreen> {
  bool _value = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Show only Cancelled rides",
                style: TextStyle(
                  fontSize: 18,
                  height: 2.1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch.adaptive(
                  activeColor: Theme.of(context).primaryColor,
                  value: _value,
                  onChanged: (value) => setState(
                        () => _value = value,
                      )),
            ],
          ),
        ),
        const Divider(
          color: Colors.black12,
          thickness: 8,
        ),
        CardWidget(),
      ],
    );
  }
}

//Food Screen
class _FoodScreen extends StatefulWidget {
  const _FoodScreen({super.key});

  @override
  State<_FoodScreen> createState() => __FoodScreenState();
}

class __FoodScreenState extends State<_FoodScreen> {
  bool _value = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Show only Cancelled orders",
              style: TextStyle(fontSize: 18, height: 2.1),
            ),
            Switch.adaptive(
                activeColor: Theme.of(context).primaryColor,
                value: _value,
                onChanged: (value) => setState(
                      () => _value = value,
                    )),
          ],
        ),
        const Divider(
          color: Colors.black12,
          thickness: 8,
        ),
        Text("data"),
      ],
    );
  }
}

class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.33,
      width: double.infinity,
      child: Card(
          child: ListView.builder(
              itemCount: riders.length,
              itemBuilder: (context, index) {
                final Rider rider;
                rider = riders[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              rider.riderName,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Report",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${rider.date}  ${rider.time}",
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${rider.price}/-",
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            const Icon(
                              Icons.radio_button_checked_outlined,
                              size: 12,
                              color: Colors.green,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              rider.pickup,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.radio_button_checked_outlined,
                              size: 12,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                rider.dropoff,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ConfirmBooking())),
                                child: const Text(
                                  "REQUEST AGAIN",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                )),
                            Text(
                              rider.distance,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    "Receipt",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                    width: MediaQuery.of(context).size.width *
                                        0.20,
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.green, width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.money,
                                            color: Colors.green,
                                            size: 20,
                                          ),
                                          Text(
                                            "CASH",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.motorcycle,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    rider.price,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.expand_circle_down_outlined,
                                        color: Colors.black38,
                                        size: 28,
                                      ))
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
