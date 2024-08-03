
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, this.onTap, required this.isLoading,
  });
  final bool isLoading ;
   final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom:16 ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.purple,
          ),
          width: 250,
          child:  Center(child: Padding(
            padding:  const EdgeInsets.all(16),
            child: isLoading ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ) : Text('Add'),
          )),
        ),
      ),
    );
  }
}
