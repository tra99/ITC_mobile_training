import 'package:flutter/material.dart';

class Homescreen2 extends StatelessWidget {
  const Homescreen2({super.key});

  @override
  Widget build(BuildContext context) {
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
        
      ],
    );
  }
}
