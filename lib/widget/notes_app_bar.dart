
import 'package:flutter/material.dart';

class AppBarNotes extends StatelessWidget {
  const AppBarNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        Text("Notes" , style: TextStyle(
          color: Colors.white,fontSize: 24
        ),),
        Spacer(),
        Container(
         decoration: BoxDecoration(borderRadius:BorderRadius.circular(16),
         color:  Colors.white.withOpacity(0.05),),
          
          child: IconButton(onPressed:() {
          
          }, icon:const Icon(Icons.search)),
        )
      ],
    );
  }
}