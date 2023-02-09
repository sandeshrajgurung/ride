import 'package:flutter/material.dart';
import 'package:sahara/models/data.dart';
import 'package:sahara/pages/screens/confirm_booking.dart';

class RideScreen extends StatefulWidget {
  const RideScreen({
    super.key,
  });

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
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
          height: 10,
        ),
        _value ? CancelledCardWidget() : CardWidget(),
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
  bool isDropdown = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
          width: double.infinity,
          child: ListView.builder(
              itemCount: riders.length,
              itemBuilder: (context, index) {
                final Rider rider;
                rider = riders[index];
                return Card(
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        const SizedBox(
                          height: 7,
                        ),
                        if (rider.userName != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Booked for: ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' ${rider.userName}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Contact Number: ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' ${rider.contact}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ConfirmBooking())),
                              child: const Text(
                                "REQUEST AGAIN",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
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
                            SizedBox(
                              child: Row(
                                children: [
                                  Text(
                                    "Receipt",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
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
                                  const SizedBox(
                                    width: 5,
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
                                    icon: Icon(
                                      isDropdown
                                          ? Icons.expand_less_outlined
                                          : Icons.expand_circle_down_outlined,
                                      color: Colors.black38,
                                      size: 28,
                                    ),
                                    onPressed: () => setState(() {
                                      isDropdown = !isDropdown;
                                    }),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Visibility(
                          visible: isDropdown ? true : false,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 17, vertical: 0),
                            height: MediaQuery.of(context).size.height * 0.23,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(18)),
                            child: Column(
                              children: [
                                const ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    'Base fare\n0.00 Kilometers',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Text(
                                    "Rs.30\nRs.34",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Divider(
                                  height: 0,
                                  color: Colors.white54,
                                  thickness: 1.5,
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  title: RichText(
                                    text: const TextSpan(
                                      text: 'Sub Total',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '\nPromo discount',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.green)),
                                      ],
                                    ),
                                  ),
                                  trailing: RichText(
                                    text: const TextSpan(
                                      text: 'Rs.64',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '\n-Rs.0',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.green)),
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(
                                  height: 0,
                                  color: Colors.white54,
                                  thickness: 1.5,
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  visualDensity: VisualDensity(vertical: -4),
                                  title: Row(
                                    children: [
                                      const Text(
                                        'Net Fare',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  trailing: Text(
                                    "Rs64",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}

class CancelledCardWidget extends StatefulWidget {
  const CancelledCardWidget({super.key});

  @override
  State<CancelledCardWidget> createState() => _CancelledCardWidget();
}

class _CancelledCardWidget extends State<CancelledCardWidget> {
  bool isDropdown = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
          width: double.infinity,
          child: ListView.builder(
              itemCount: riders.length,
              itemBuilder: (context, index) {
                final Rider rider;
                rider = riders[index];
                return Card(
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        const SizedBox(
                          height: 7,
                        ),
                        if (rider.userName != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Booked for: ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' ${rider.userName}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Contact Number: ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' ${rider.contact}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ConfirmBooking())),
                              child: const Text(
                                "REQUEST AGAIN",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
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
                            SizedBox(
                              child: Row(
                                children: [
                                  Text(
                                    "Receipt",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
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
                                  const SizedBox(
                                    width: 5,
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
                                    icon: Icon(
                                      isDropdown
                                          ? Icons.expand_less_outlined
                                          : Icons.expand_circle_down_outlined,
                                      color: Colors.black38,
                                      size: 28,
                                    ),
                                    onPressed: () => setState(() {
                                      isDropdown = !isDropdown;
                                    }),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Visibility(
                          visible: isDropdown ? true : false,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 17, vertical: 0),
                            height: MediaQuery.of(context).size.height * 0.22,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(18)),
                            child: Column(
                              children: [
                                const ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    'Base fare\n0.00 Kilometers',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Text(
                                    "Rs.30\nRs.34",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Divider(
                                  height: 0,
                                  color: Colors.white54,
                                  thickness: 1.5,
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  title: RichText(
                                    text: const TextSpan(
                                      text: 'Sub Total',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '\nPromo discount',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.green)),
                                      ],
                                    ),
                                  ),
                                  trailing: RichText(
                                    text: const TextSpan(
                                      text: 'Rs.64',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '\n-Rs.0',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.green)),
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(
                                  height: 0,
                                  color: Colors.white54,
                                  thickness: 1.5,
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  visualDensity: VisualDensity(vertical: -4),
                                  title: Row(
                                    children: [
                                      const Text(
                                        'Net Fare',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  trailing: Text(
                                    "Rs64",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
