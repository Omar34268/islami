import 'package:flutter/material.dart';
import 'package:islam/home/ahadethlist.dart';
class Ahadethdetails extends StatelessWidget {
  static const String routeName = "Ahadethdetails";
  const Ahadethdetails({super.key});
  @override
  Widget build(BuildContext context) {
    hadeth arg=ModalRoute.of(context)?.settings.arguments as hadeth;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/background.png"),fit: BoxFit.fill)
        ),
        child: Scaffold(
            appBar: AppBar(
              title: Text(arg.Title),
            ),
            body:Column(
              children: [
                Expanded(
                  child: Card(
                    margin: EdgeInsets.all(20),
                    child: SingleChildScrollView(child: Text(arg.content,style: TextStyle(
                      fontSize: 30
                    ),))
                  ),
                ),
              ],
            )
        ));
  }
}
