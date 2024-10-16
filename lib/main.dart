import 'package:flutter/material.dart';
import 'package:islam/AHADETHDETAILS/Ahadethdetails.dart';
import 'package:islam/home/Homescreen.dart';
import 'package:islam/home/quran_details/quran_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 15,
          margin: EdgeInsets.all(20),
          surfaceTintColor: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black,
          )
            
        ),
        scaffoldBackgroundColor: Colors.transparent,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(
            color: Colors.black,
            size: 35,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 35
          )

        ) ,
        dividerColor: Color(0xffB7935F),
        dividerTheme: DividerThemeData(
          color: Color(0xffB7935F),
          thickness: 2
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,
         primary: Color(0xffB7935F),
            secondary: Color(0xffB7935F).withOpacity(0.57),
          onPrimary: Colors.white,
          onSecondary: Colors.black
        ),
        useMaterial3: true,
      ),
      initialRoute: Homescreen.routeName,
      routes: {
        Homescreen.routeName:(context)=>Homescreen(),
        QuranDetailsScreen.routeName:(context)=>QuranDetailsScreen(),
        Ahadethdetails.routeName:(context)=>Ahadethdetails(),
      },
    );
  }
}

