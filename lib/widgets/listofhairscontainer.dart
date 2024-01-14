import 'package:barber/screens/containerDetails.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ContainerItem extends StatelessWidget {
  final int index;

  ContainerItem({required this.index});

  String _getRandomImage() {
    final Random random = Random();
    final int randomIndex = random.nextInt(5) + 1;
    return 'assets/images/image$randomIndex.jpeg';
  }

  @override
  Widget build(BuildContext context) {
    String imagePath = _getRandomImage();

    return GestureDetector(
      onTap: () {
        // Navigate to details screen when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HaircutDetailsScreen(
              index: index,
              imagePath: imagePath,
              haircutName: 'Haircut Name',
              location: 'Location',
            ),
          ),
        );
      },
      child: Container(
        height: 130,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[100]!,
              spreadRadius: 5.0,
              blurRadius: 2.0,
              // offset: Offset(5, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[100]!,
                      spreadRadius: 3.0,
                      blurRadius: 2.0,
                      offset: Offset(0, 1),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              // Center: Text content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Container $index',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Haircut Name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Location',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              // Right side: Bookmark icon
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Icon(
                  Icons.bookmark,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
