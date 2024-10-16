import 'package:flutter/material.dart';
import 'package:islam/home/quran_details/quran_details_screen.dart';
class Suraname extends StatelessWidget {
  final String suraname;
   final int suranumber;
   final int index;
  const Suraname({super.key,required this.suraname,required this.suranumber,required this.index});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
       Navigator.pushNamed(context,QuranDetailsScreen.routeName,arguments: QuranArg(name: suraname, index: index));
      },
      child: Row(
        children: [
          Expanded(
            child: Text( suraname,
          textAlign: TextAlign.center,style: TextStyle(
                fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
          ),
          Container(
            height: 50,
            width: 2,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary
            ),
          ),
          Expanded(
            child: Text(suranumber.toString(), textAlign: TextAlign.center,style:TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          )
        ],
      ),
    );
  }
}
