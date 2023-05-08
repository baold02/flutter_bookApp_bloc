import 'package:book_app/bloc/oder_bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/book_order_model.dart';
import '../services/order_api_service/order_book_api.dart';

class ItemOrder extends StatefulWidget {
  final List<BookOrderModel> bookOrder;
  final int index;
  const ItemOrder({Key? key, required this.bookOrder, required this.index}) : super(key: key);

  @override
  State<ItemOrder> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Wrap(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: SizedBox(
                    height: 90,
                    width: 63,
                    child: Image.network(widget.bookOrder[widget.index].imgae.toString()),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        widget.bookOrder[widget.index].name.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.fromLTRB(0, 10, 140, 0),
                        child: Text(
                          widget.bookOrder[widget.index].price.toString(),
                          style: const TextStyle(color: Colors.red),
                        )),
                  ],
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: (){
                      BlocProvider.of<OrderBloc>(context).add(OrderDelete(widget.bookOrder[widget.index].id.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Xóa thành công"),
                              duration: Duration(milliseconds: 500),
                            ));
                    },
                    child: const Icon(
                      Icons.remove_shopping_cart_outlined,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );;
  }
}
