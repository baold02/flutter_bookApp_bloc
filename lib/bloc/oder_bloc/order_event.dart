part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
}


class FetchListOrder extends OrderEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}


class OrderBookEvent extends OrderEvent{
  String idBook,name,price,image,des,athur,rate;
  int quantity;


  OrderBookEvent(this.idBook, this.name, this.price, this.image, this.des,
      this.athur, this.rate, this.quantity);

  @override
  // TODO: implement props
  List<Object?> get props => [idBook,name,price,image,des,athur,rate,quantity];
}

class OrderDelete extends OrderEvent{
  final String id;

  OrderDelete(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}
