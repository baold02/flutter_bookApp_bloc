import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key, required this.text, this.width1}) : super(key: key);
  final String text;
  final double? width1;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
         height: 40,
         width: widget.width1,
         decoration: BoxDecoration(
           color: Colors.orangeAccent,
           borderRadius: BorderRadius.circular(5)
         ),
      child: Center(
        child: Text(widget.text,
        style: const TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}
