import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahara/models/data.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({super.key});

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
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
        title: Text("Promo Code"),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(15),
          itemCount: promos.length,
          itemBuilder: (context, index) {
            final Promo promo;
            promo = promos[index];

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        children: [
                          Text(
                            promo.desc,
                            style: TextStyle(fontSize: 16, wordSpacing: -1),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            'Exp date:${promo.expiryDate}',
                            style: const TextStyle(
                                fontFamily: "sans",
                                color: Colors.black,
                                fontSize: 14,
                                wordSpacing: -1),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('lib/assets/sahara-bike.png'),
                          Container(
                            padding: EdgeInsets.all(5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 1,
                              ),
                            ),
                            child: Center(
                                child: Text(
                              promo.code,
                              style: TextStyle(fontSize: 12),
                            )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            );
          }),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          height: 65,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            color: Colors.white,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 20,
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: SingleChildScrollView(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.25,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ADD PROMO CODE",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(17),
                                        labelText: 'Promo Code',
                                        labelStyle: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .color,
                                            fontSize: 14),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 2),
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        )),
                                        errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 5))),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                backgroundColor: Colors.black),
                                            onPressed: () {},
                                            child: Text("Cancel")),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor),
                                            onPressed: () {},
                                            child: Text("Apply")),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Text(
                  "APPLY PROMO CODE",
                  style: TextStyle(fontSize: 18),
                )),
          )),
    );
  }
}
