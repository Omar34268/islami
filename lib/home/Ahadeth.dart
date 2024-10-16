import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam/AHADETHDETAILS/Ahadethdetails.dart';
import 'ahadethlist.dart';
class Ahadeth extends StatefulWidget {
  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  @override
  Widget build(BuildContext context) {
    loadfile();
    return Column(
      children: [
        Expanded(child: Image.asset("assets/ahadeth_image.png")),
        Divider(),
        Text("Ahadeth",style:  TextStyle(
          fontSize: 25,
          fontWeight:  FontWeight.w600
        ),),
        Divider(),
        Expanded(
          flex: 2,
          child: ListView.separated(itemBuilder: (context, index) => InkWell(
            onTap: (){
              Navigator.of(context).pushNamed(Ahadethdetails.routeName,arguments: ahadetlist[index]);
            },
            child: Text(ahadetlist[index].Title,style:
              TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,),
          ),
              separatorBuilder:(context, index) => SizedBox(height: 10,) ,
              itemCount: ahadetlist.length),
        )
      ],
    );
  }

  List<hadeth> ahadetlist=[];

  loadfile() async {
   String filecontent= await rootBundle.loadString("assets/files/ahadeth.txt");
   List<String> ahadeth=filecontent.split("#");
   for(int i=0;i<ahadeth.length;i++){
     List<String> ahadethlines=ahadeth[i].trim().split(("\n"));
     String ahadethTitle = ahadethlines[0];
     ahadethlines.removeAt(0);
     String ahadethcontent=ahadethlines.join(" ");
     ahadetlist.add(hadeth(ahadethTitle, ahadethcontent));
   }
   setState(() {

   });
  }
}