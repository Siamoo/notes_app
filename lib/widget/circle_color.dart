

import 'package:flutter/material.dart';

class CircleColor extends StatelessWidget {
  const CircleColor({
    super.key, required this.isActive, required this.color,
  });

  final bool isActive;
  final Color color ;

  @override
  Widget build(BuildContext context) {
    return isActive ? CircleAvatar(
      backgroundColor: color,
      radius: 16,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width:3),
            borderRadius: BorderRadius.circular(50)),
        padding: const EdgeInsets.all(5.0),
       
      ),
      
    ) :  CircleAvatar(
      backgroundColor: color ,
      radius: 16,
    );
  }
}


