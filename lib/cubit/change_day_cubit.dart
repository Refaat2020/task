import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task/model/element_model.dart';

part 'change_day_state.dart';

class ChangeDayCubit extends Cubit<ChangeDayState> {
  ChangeDayCubit() : super(ChangeDayInitial());
  CalendarController calendarController = CalendarController();
  GroupedItemScrollController scrollController = GroupedItemScrollController();
List<ElementModel>elements = [
  ElementModel(DateTime.now(), 'Got to gym', ),
  ElementModel(DateTime.now().add(Duration(days: 1)), 'Work',),
  ElementModel(DateTime.now().add(Duration(days: 2)), 'Buy groceries'),
  ElementModel(DateTime.now().add(Duration(days: 3)), 'Cinema'),
  ElementModel(DateTime.now().add(Duration(days: 4)), 'Eat',),
  ElementModel(DateTime.now().add(Duration(days: 5)), 'Car wash',),
  ElementModel(DateTime.now().add(Duration(days: 6)), 'Car wash',),
];

  void changeDay(DateTime day, List events, List holidays){
    emit(ChangeDayLoading());
    int index=0;

    calendarController.setSelectedDay(day);
    elements.forEach((element) {
      if (element.date.day == day.day) {
        print(element.date.day);
        index = elements.indexOf(element);
      }
    });
    scrollController.scrollTo(index: index,duration: Duration(milliseconds: 500));

    // elements.map((e) {
    //   if(e.date == day){
    //     index = elements.indexOf(e);
    //
    //   }
    //
    // });

    print(index);

  }



}
