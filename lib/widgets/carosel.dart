import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderContainer extends StatefulWidget {
  @override
  _CarouselSliderContainerState createState() =>
      _CarouselSliderContainerState();
}

class _CarouselSliderContainerState extends State<CarouselSliderContainer> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            spreadRadius: 0.1,
            blurRadius: 2,
            // offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: [
                buildCarouselItem('assets/images/image5.jpeg'),
                buildCarouselItem('assets/images/image3.jpeg'),
                buildCarouselItem('assets/images/image2.jpeg'),
                buildCarouselItem('assets/images/image1.jpeg'),
                buildCarouselItem('assets/images/image4.jpeg'),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => buildDot(index, _currentIndex == index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCarouselItem(String imagePath) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          width: 250,
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildDot(int index, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.blue : Colors.white,
      ),
    );
  }
}
