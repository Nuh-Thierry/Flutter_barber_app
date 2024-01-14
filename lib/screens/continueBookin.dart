import 'package:barber/widgets/buttonContainer.dart';
import 'package:flutter/material.dart';

class ContinueBookingScreen extends StatelessWidget {
  final int? index;
  final String imagePath;
  final String? haircutName;
  final String? location;
  final String selectedDate;
  final String selectedTime;

  ContinueBookingScreen({
    this.index,
    required this.imagePath,
    this.haircutName,
    this.location,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    if (location != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            location!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "yada yada yada",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15,
                top: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Booking Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Add your two containers here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildIconContainer(
                          Icons.calendar_today, 'Date', selectedDate),
                      _buildIconContainer(
                          Icons.access_time, 'Time', selectedTime),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[100]!,
                              spreadRadius: 3.0,
                              blurRadius: 2.0,
                              offset: Offset(0, 1),
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/image8.jpeg'), // Replace with actual image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Jordan Coiffeur shop',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Services',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Short perpendicular cut',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'low perpendicular cut',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.blue.withOpacity(0.2),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.blue.withOpacity(0.5),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Add Item',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Your request have been completed and every details is displayed on this screen. Fell free to cancel request and modify it as you wish.',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtonContainer(
        location: location,
        text: "Cancel Booking",
        onPressed: () {},
      ),
    );
  }

  Widget _buildIconContainer(IconData icon, String text, String outsideText) {
    return Expanded(
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70, // You can adjust the width as needed
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(15),
            child: Icon(
              icon,
              size: 30,
              color: Colors.blue,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    //fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  outsideText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
