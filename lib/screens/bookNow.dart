import 'package:barber/screens/continueBookin.dart';
import 'package:barber/widgets/buttonContainer.dart';
import 'package:barber/widgets/calender.dart';
import 'package:barber/widgets/time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookNowScreen extends StatefulWidget {
  final String location;
  final String imagePath;

  BookNowScreen({required this.location, required this.imagePath});

  @override
  State<BookNowScreen> createState() => _BookNowScreenState();
}

class _BookNowScreenState extends State<BookNowScreen> {
  late String selectedDate;
  late String selectedTime;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    DateTime now = DateTime.now();
    selectedDate = _getFormattedDate(now);
    selectedTime = _getFormattedTime(TimeOfDay.fromDateTime(now));
  }

  String _getFormattedDate(DateTime dateTime) {
    return DateFormat('MMMM dd, yyyy').format(dateTime);
  }

  String _getFormattedTime(TimeOfDay timeOfDay) {
    return timeOfDay.format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
          left: 10,
          right: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      //offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.withOpacity(0.1),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(width: 30),
                      Icon(Icons.location_on),
                      SizedBox(width: 8),
                      Text(
                        widget.location,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Your Barber',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 10),
              Row(
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
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jordan Coiffeur shop',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      // Add additional information about the barber if needed
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text(
                'Select Date',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 16),
              Calender(
                onSelectedDate: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Time(
                onSelectedTime: (time) {
                  setState(() {
                    selectedTime = time;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonContainer(
        text: "Continue Booking",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContinueBookingScreen(
                imagePath: widget.imagePath,
                location: widget.location,
                selectedDate: selectedDate,
                selectedTime: selectedTime,
              ),
            ),
          );
        },
      ),
    );
  }
}
