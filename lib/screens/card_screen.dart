import 'package:book_app/bloc/oder_bloc/order_bloc.dart';
import 'package:book_app/widget/item_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state is BookLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is OderBookLoaded) {
              print(state.listOdrer.first.imgae);
              return Expanded(
                child: ListView.builder(
                    itemCount: state.listOdrer.length,
                    // shrinkWrap: true,
                    itemBuilder: (context, index) =>ItemOrder(bookOrder: state.listOdrer, index: index),),
              );
            }
            if (state is BookOdrerLoadError) {
              return Text(state.LoadBookError);
            }
            return Container();
          },
        ),
      ],
    );
  }
}
