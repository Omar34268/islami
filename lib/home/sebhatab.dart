import 'package:flutter/material.dart';
import 'dart:math'; // For pi value

class Sebhatab extends StatefulWidget {
  const Sebhatab({super.key});

  @override
  State<Sebhatab> createState() => _SebhatabState();
}

class _SebhatabState extends State<Sebhatab> with SingleTickerProviderStateMixin {
  int count = 0;
  int cycleIndex = 0; // Tracks the current cycle
  List<String> texts = [
    "سبحان الله",
    "الله أكبر",
    "الحمد لله",
    "لا إله إلا الله"
  ];

  late AnimationController _controller; // Animation controller for rotation

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Rotation duration
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to free resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Stack to position head and body images
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // Head of Seb7a
              Positioned(
                top: -80,
                child: Container(
                  margin: const EdgeInsets.only(left: 50),
                  child: Image.asset(
                    "assets/head_of_seb7a.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Rotating body of Seb7a on click
              GestureDetector(
                onTap: () {
                  setState(() {
                    count++;
                    if (count > 33) {
                      count = 0;
                      cycleIndex = (cycleIndex + 1) % texts.length;
                    }
                  });

                  // Start rotation animation
                  _controller.forward(from: 0);
                },
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _controller.value * 2 * pi, // Full 360-degree rotation
                      child: child,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      "assets/body_of_seb7a.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Display the number of tasbeehs
          const Text(
            "عدد التسبيحات",
            style: TextStyle(fontSize: 25),
          ),

          // Counter display with decoration
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "$count",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),

          // Text display with decoration
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              texts[cycleIndex], // Display the current text
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
