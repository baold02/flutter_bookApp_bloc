import 'package:book_app/screens/details_book.dart';
import 'package:flutter/material.dart';

import '../models/Book_model.dart';
import '../utils/app_style.dart';
import '../utils/size_config.dart';
class ItemHomeWidget extends StatefulWidget {
  final List<BookModel> listBook;
  final int index;
  const ItemHomeWidget({Key? key, required this.listBook, required this.index}) : super(key: key);

  @override
  State<ItemHomeWidget> createState() => _ItemHomeWidgetState();
}

class _ItemHomeWidgetState extends State<ItemHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBook(image: widget.listBook[widget.index].imgae.toString(), name: widget.listBook[widget.index].name.toString(),description: widget.listBook[widget.index].description.toString(),price: widget.listBook[widget.index].price.toString()),));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Positioned(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(KBoderRadius),
                child: Image.network(widget.listBook[widget.index].imgae.toString(),fit: BoxFit.cover,),
              )),
          const SizedBox(height: 8,),
          Text(widget.listBook[widget.index].name.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: kEncodeSansSemiBold.copyWith(
                  color: kDrakBrown,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5
              )),
          const SizedBox(height: 5,),
          Text(widget.listBook[widget.index].status.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: kEncodeSansRagular.copyWith(
                  fontWeight: FontWeight.bold,
                  color:widget.listBook[widget.index].status == 'Còn hàng' ? Colors.green : Colors.red,
                  fontSize: SizeConfig.blockSizeHorizontal! * 2.5
              )),

          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${widget.listBook[widget.index].price}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: kEncodeSansSemiBold.copyWith(
                      color: kDrakBrown,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5
                  )),

              Row(
                children: [
                  const Icon(Icons.star,color: Colors.yellow,size: 16,),
                  const SizedBox(width: 4,),
                  Text('${widget.listBook[widget.index].rate}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kEncodeSansRagular.copyWith(
                          color: kDrakBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3
                      )),

                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
