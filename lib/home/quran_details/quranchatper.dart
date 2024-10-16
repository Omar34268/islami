import 'package:flutter/material.dart';
class Quranchatper extends StatelessWidget {
  String  chapter;
  int index;
   Quranchatper({super.key,required this.chapter,required this.index});

  @override
  Widget build(BuildContext context) {

    return Text("$chapter (${index+1})",textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: TextStyle(
      fontSize: 20,color: Colors.black
    ),);
  }
}
