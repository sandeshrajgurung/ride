// import 'package:flutter/material.dart';

// class FeaturedRestaurant extends StatefulWidget {
//   const FeaturedRestaurant({super.key});

//   @override
//   State<FeaturedRestaurant> createState() => _FeaturedRestaurantState();
// }

// class _FeaturedRestaurantState extends State<FeaturedRestaurant> {
//   late PageController _pageController;
//   List<String> images = [
//     "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
//     "https://wallpaperaccess.com/full/2637581.jpg",
//     "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(viewportFraction: 0.8);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//         itemCount: images.length,
//         pageSnapping: true,
//         controller: _pageController,
//         onPageChanged: (page) {
//           setState(() {
//             activePage = page;
//           });
//         },
//         itemBuilder: (context, pagePosition) {
//           return Container(
//             margin: EdgeInsets.all(10),
//             child: Image.network(images[pagePosition]),
//           );
//         });
//   }
// }
