import 'package:flutter/material.dart';

class AppBarNotes extends StatelessWidget {
  const AppBarNotes({
    super.key, required this.titel, required this.theicon, this.onPressed, 
  });
  final void Function()? onPressed;
 final String titel;
 final Icon theicon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(
          titel,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white.withOpacity(0.05),
          ),
          child: IconButton(onPressed: onPressed, icon:  theicon),
        )
      ],
    );
  }
}
