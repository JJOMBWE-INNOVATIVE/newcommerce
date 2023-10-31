
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';

class MyCarousel extends StatefulWidget {
  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int _currentImage = 0;
  final List<String> images = [
    "images/grooming.jpeg",
    "images/shoes.jpeg",
    "images/jewery.jpeg",
    "images/womenshoes.jpeg",
    "images/womenss.jpeg",
    // Add more image paths here
  ];

  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    // Automatically change images every 3 seconds
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (mounted) {
        _controller.nextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: images.map((imagePath) {
            return Image.asset(imagePath, fit: BoxFit.cover);
          }).toList(),
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            autoPlay: true, // Set this to true to enable auto-playing
            onPageChanged: (index, reason) {
              setState(() {
                _currentImage = index;
              });
            },
          ),
          carouselController: _controller,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.map((image) {
            int index = images.indexOf(image);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentImage == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Auto-Playing Carousel Example'),
//       ),
//       body: MyCarousel(),
//     ),
//   ));
// }
