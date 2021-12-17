import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task/cubit/change_day_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/stacky_note_widget.dart';


class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    final dayCubit = context.watch<ChangeDayCubit>();
    return Scaffold(
      appBar:   AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 110.h,
        title: TableCalendar(
          calendarController:dayCubit.calendarController ,
          startDay: DateTime.now(),
          endDay: DateTime.now().add(Duration(days: 6)),
          daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: TextStyle(color: Colors.black),weekendStyle: TextStyle(color: Colors.red)),
          initialCalendarFormat: _calendarFormat,
          calendarStyle: CalendarStyle(highlightToday: false,selectedColor: Colors.blue,weekdayStyle:TextStyle(color: Colors.black) ),
          headerVisible: false,
         startingDayOfWeek: StartingDayOfWeek.saturday,
         formatAnimation: FormatAnimation.slide,

         availableGestures: AvailableGestures.all,
          onDaySelected: (day, events, holidays) {
            dayCubit.changeDay(day, events, holidays);
          },
        ),
      ),
      body:   NoteScreen(),
    );
  }
}
