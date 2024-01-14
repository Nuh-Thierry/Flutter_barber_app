import 'package:barber/screens/bookNow.dart';
import 'package:barber/widgets/buttonContainer.dart';
import 'package:flutter/material.dart';

class HaircutDetailsScreen extends StatelessWidget {
  final int index;
  final String imagePath;
  final String haircutName;
  final String location;

  HaircutDetailsScreen({
    required this.index,
    required this.imagePath,
    required this.haircutName,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0, left: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Container $index',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Haircut Name: $haircutName',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Location: $location',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 30),
                      // Row containing circular containers with icons and text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildIconWithText(Icons.call, 'Call'),
                          _buildIconWithText(Icons.directions, 'Map'),
                          _buildIconWithText(Icons.message, 'Message'),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 1,
                        color: Colors.blue[200], // Adjust the color here
                      ),
                      SizedBox(height: 20),
                      // Adding 5 containers with a height of 100 in blue color
                      for (int i = 0; i < 2; i++)
                        Container(
                          height: 60,
                          color: Colors.blue,
                          margin: EdgeInsets.symmetric(vertical: 10),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ButtonContainer(
        location: location,
        text: "Book Now",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BookNowScreen(location: location, imagePath: imagePath),
            ),
          );
        },
      ),
    );
  }

  Widget _buildIconWithText(IconData icon, String text) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: Colors.blue,
            size: 25,
          ),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
