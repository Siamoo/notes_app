
import 'package:flutter/material.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Color.fromARGB(255, 235, 168, 93),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Flutter tips',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              Spacer(),
              IconButton(
               
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Walid siam i love to make that for funy ',
                    style: TextStyle(color: Colors.black.withOpacity(.5),fontSize: 17),
                  ),
                ),
                SizedBox(
                  width: 85,
                )
              ],
            ),
          ),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  'oct 15.2002',
                  style: TextStyle(color: Colors.black.withOpacity(.5)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

