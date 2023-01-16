import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FeaturedRestaurant extends StatefulWidget {
  const FeaturedRestaurant({super.key});

  @override
  State<FeaturedRestaurant> createState() => _FeaturedRestaurantState();
}

class _FeaturedRestaurantState extends State<FeaturedRestaurant> {
  final urlImages = [
    'https://brandguff.com/wp-content/uploads/2022/03/image-11.png'
        'https://img.freepik.com/premium-vector/hot-grill-logo-templates_15146-116.jpg'
        'https://experiencenepalnow.com/wp-content/uploads/2016/11/222_310-Pixel-Logo-Himalayan-Java.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: urlImages.length,
        itemBuilder: (context, index, realIndex) {
          final urlImage = urlImages[index];

          return buildImage(urlImage, index);
        },
        options: CarouselOptions(height: double.infinity));
  }

  Widget buildImage(String urlImage, int index) => Container(
        height: 200,
        color: Colors.grey,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
}
