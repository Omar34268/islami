import 'package:flutter/material.dart';
import 'package:islam/home/Ahadeth.dart';
import 'package:islam/home/moshaftab.dart';
import 'package:islam/home/radiotab.dart';
import 'package:islam/home/sebhatab.dart';
class Homescreen extends StatefulWidget {
  static const String routeName="homescreen";

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selected_index=0;
  List<Widget> tabs=[
    Moshaftab(),
    Ahadeth(),
    Sebhatab(),
    Radiotab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/background.png"),fit: BoxFit.fill)
      ),
        child: Scaffold(
          appBar: AppBar(
            title: Text("اسلامي"),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: selected_index,
              onTap: (index){
              setState(() {
                selected_index = index;
              });
              },
              items:[

            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
                label: "Quran",
                icon: ImageIcon(AssetImage("assets/moshaf_blue.png"))
            ),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: "Ahadeth",
                icon: ImageIcon(AssetImage("assets/Group 6.png"))
            ),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: "Sebha",
                icon: ImageIcon(AssetImage("assets/sebha_blue.png"))
            ),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: "Radio",
                icon: ImageIcon(AssetImage("assets/radio_blue.png"))
            )
          ]),
          body: tabs[selected_index],
        ));
  }
}
