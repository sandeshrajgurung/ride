import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:sahara/pages/screens/history/food_screen.dart';
import 'package:sahara/pages/screens/history/ride_screen.dart';

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
              // animationDuration: Duration.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
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
                              const BoxDecoration(color: Colors.transparent),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 32,
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                          tabs: const [
                            Tab(
                              text: "Ride",
                            ),
                            Tab(
                              text: "Food",
                            )
                          ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 8,
                      height: 0,
                    ),
                    const Expanded(
                        child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [RideScreen(), FoodScreen()]))
                  ],
                ),
              ))),
    );
  }
}
