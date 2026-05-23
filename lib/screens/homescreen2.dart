import 'package:flutter/material.dart';

class Homescreen2 extends StatelessWidget {
  const Homescreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              "https://tse2.mm.bing.net/th/id/OIP.BD9cf1eaFBIVQLMXThVtLgHaE6?rs=1&pid=ImgDetMain&o=7&rm=3",
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          color: Colors.yellow,
          width: screenWidth,
          height: screenHeight * 0.28,
          child: Column(
            children: [
              Image.network(
                "https://tse2.mm.bing.net/th/id/OIP.BD9cf1eaFBIVQLMXThVtLgHaE6?rs=1&pid=ImgDetMain&o=7&rm=3",
                width: screenWidth * 0.7,
                height: screenHeight * 0.2,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.heart_broken, color: Colors.red, size: 32),
                      Text(
                        'Heart Broken',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.comment, color: Colors.green, size: 32),
                      Text(
                        'Comment',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 32),
                      Text(
                        'Star',
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
