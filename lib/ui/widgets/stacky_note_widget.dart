import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';
import 'package:task/cubit/change_day_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/model/element_model.dart';

class NoteScreen extends StatefulWidget {

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {

  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  @override
  Widget build(BuildContext context) {
    final dayCubit = context.watch<ChangeDayCubit>();
    return StickyGroupedListView<ElementModel,DateTime>(
      elements: dayCubit.elements,
      itemScrollController:dayCubit.scrollController ,
      itemPositionsListener:itemPositionsListener,
      order: StickyGroupedListOrder.ASC,
      groupBy: ( element) =>
          DateTime(element.date.year, element.date.month, element.date.day),
      groupComparator: (DateTime value1, DateTime value2) =>
          value2.compareTo(value1),
      itemComparator: ( element1,  element2) =>
          element1.date.compareTo(element2.date),
      floatingHeader: false,

      groupSeparatorBuilder: ( element) => Container(
        height: 60.w,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 30.w),
          decoration: BoxDecoration(
            color: Color(0xfff6f9fe),
            border: Border.all(
              color: Color(0xfff6f9fe),
              width: 2
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${element.date.day == DateTime.now().day ? "Today":""} ${DateFormat('EEE MMM d').format(element.date)}',
                   style: TextStyle(color: Color(0xff9aa0af),fontWeight: FontWeight.w700,fontSize: 14.sp),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              const Icon(Icons.add,color: Colors.blue,),
              SizedBox(width: 30.w,)
            ],
          ),
        ),
      ),

      indexedItemBuilder: (context, element, index) {
        return Container(
          height: 100,
            padding: EdgeInsets.only(top: 30.h,left: 50.w),
            child: Text("No appointments",style: TextStyle(color: Color(0xff9599a2
            ),fontSize: 14,fontWeight: FontWeight.w600),));
      },
      padding: EdgeInsets.only(bottom: 200.h),

    );
  }


}

