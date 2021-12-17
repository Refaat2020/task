import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/cubit/change_day_cubit.dart';
import 'package:task/ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () =>  MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ChangeDayCubit(),),

        ],
        child: MaterialApp(
         debugShowCheckedModeBanner: false,
          theme: ThemeData(

            primarySwatch: Colors.blue,

            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}

