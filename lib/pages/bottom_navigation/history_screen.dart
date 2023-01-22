import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

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
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "History",
                        style: TextStyle(fontSize: 24),
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
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Show only Cancelled rides",
                  style: TextStyle(fontSize: 20, height: 2.1),
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
        ],
      ),
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
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Show only Cancelled orders",
                style: TextStyle(fontSize: 20, height: 2.1),
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
        ],
      ),
    );
  }
}
