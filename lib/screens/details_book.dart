import 'package:book_app/models/Book_model.dart';
import 'package:flutter/material.dart';

class DetailBook extends StatefulWidget {
  final String name;
  final String description;
  final String image;
  const DetailBook({Key? key, required this.name, required this.description, required this.image }) : super(key: key);

  @override
  State<DetailBook> createState() => _DetailBookState();
}

class _DetailBookState extends State<DetailBook> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            // image: Image.network(widget.image ?"" ""),
          ),
        ),
        Image.network(widget.image),
        Text(widget.description)
      ],
    );
  }
}
