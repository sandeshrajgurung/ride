import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "History",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(0), // Creates border
                color: Colors.greenAccent),
            tabs: [
              Text("Ride"),
              Text("Food"),
            ],
          ),
        ),
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [_RideScreen(), _FoodScreen()]),
      ),
    );
  }
}

//Ride screen
class _RideScreen extends StatefulWidget {
  const _RideScreen({super.key});

  @override
  State<_RideScreen> createState() => __RideScreenState();
}

class __RideScreenState extends State<_RideScreen> {
  @override
  Widget build(BuildContext context) {
    return Text("hfdosihf");
  }
}

//Food Screen
class _FoodScreen extends StatefulWidget {
  const _FoodScreen({super.key});

  @override
  State<_FoodScreen> createState() => __FoodScreenState();
}

class __FoodScreenState extends State<_FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Text("hfdosihf");
  }
}
