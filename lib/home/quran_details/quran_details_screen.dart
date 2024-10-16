import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam/home/quran_details/quranchatper.dart';
class QuranDetailsScreen extends StatefulWidget {
  static const String routeName="QuranDetails";

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    QuranArg arg=ModalRoute.of(context)?.settings.arguments as QuranArg;
    if (suraline.isEmpty){
    loadfiles(arg.index);
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/background.png"),fit: BoxFit.fill)
      ),
        child: Scaffold(
          appBar: AppBar(
             title: Text(arg.name),
          ),
          body: Card(
            margin: EdgeInsets.all(20),
            child: suraline.isEmpty ? Center(child: CircularProgressIndicator()):ListView.separated(itemBuilder: (context, index) => Quranchatper(chapter: suraline[index], index: index),
                separatorBuilder:(context, index) => Divider(),
                itemCount: suraline.length),
          )
        ));
  }

  List<String> suraline=[];

  loadfiles(int index) async {
    String filecontent =  await rootBundle.loadString("assets/files/${index+1}.txt");
     suraline =filecontent.split("\n");
     setState(() {

     });
    print(suraline);
  }

}
class QuranArg{
  String name;
  int index;
  QuranArg({required this.name,required this.index});
}