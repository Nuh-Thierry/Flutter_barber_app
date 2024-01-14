import 'package:intl/intl.dart';

import 'package:barber/widgets/event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  final ValueChanged<String> onSelectedDate;
  const Calender({super.key, required this.onSelectedDate});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Store the events created
  Map<DateTime, List<Event>> event = {};

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusDay;
        widget.onSelectedDate(DateFormat('MMMM dd, yyyy').format(selectedDay));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100]!,
            spreadRadius: 3.0,
            blurRadius: 2.0,
            //offset: Offset(0, 1),
          ),
        ],
      ),
      child: TableCalendar(
        focusedDay: _focusedDay,
        firstDay: DateTime(2000),
        lastDay: DateTime(2050),
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        startingDayOfWeek: StartingDayOfWeek.monday,
        onDaySelected: _onDaySelected,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronMargin: EdgeInsets.only(left: 20),
          rightChevronMargin: EdgeInsets.only(right: 20),
          leftChevronIcon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.withOpacity(0.1),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          rightChevronIcon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.withOpacity(0.1),
            ),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
          ),
          leftChevronPadding: EdgeInsets.all(0),
          rightChevronPadding: EdgeInsets.all(0),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          defaultTextStyle: TextStyle(color: Colors.blue),
          selectedDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.withOpacity(0.5),
          ),
        ),
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: ((focusedDay) {
          _focusedDay = focusedDay;
        }),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.black),
          weekendStyle: TextStyle(color: Colors.black),
        ),
        availableGestures: AvailableGestures.none,
      ),
    );
  }
}
