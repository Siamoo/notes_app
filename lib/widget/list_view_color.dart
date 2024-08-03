import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/widget/circle_color.dart';

class ListViewColor extends StatefulWidget {
  const ListViewColor({
    super.key,
  });

  @override
  State<ListViewColor> createState() => _ListViewColorState();
}

class _ListViewColorState extends State<ListViewColor> {
  int currentIndex = 0;
  List<Color> colors = [
    Color(Color(0xff003B5C).value),
    Color(Color(0xff26264c).value),
    Color(Color(0xff5d3838).value),
    Color(Color(0xff294b46).value),
    Color(Color(0xff3c0d40).value),
    Color(Color(0xff561a45).value),
    Color(Color(0xff2C3E50).value),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: colors.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNotesCubit>(context).color = colors[index];
                setState(() {});
              },
              child: CircleColor(
                color: colors[index],
                isActive: currentIndex == index,
              )),
        );
      },
    );
  }
}
