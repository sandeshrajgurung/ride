//Food Screen
import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Show only Cancelled orders",
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
          height: 10,
        ),
      ],
    );
  }
}
