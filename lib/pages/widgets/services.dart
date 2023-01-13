import 'package:flutter/material.dart';

class SaharaServices extends StatelessWidget {
  final Text text;
  final Image imageAsset;
  final void Function() onTap;
  const SaharaServices({
    super.key,
    required this.text,
    required this.imageAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 145,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 60, width: 60, child: imageAsset),
            text,
          ],
        ),
      ),
    );
  }
}
