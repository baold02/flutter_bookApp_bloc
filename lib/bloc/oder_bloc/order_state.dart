part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();
}

class OrderInitial extends OrderState {
  @override
  List<Object> get props => [];
}

class BookLoading extends OrderState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class OrderSuccsess extends OrderState{
  List<BookOrderModel> listOrder;

  OrderSuccsess(this.listOrder);

  @override
  // TODO: implement props
  List<Object?> get props => [listOrder];

}

class OderBookLoaded extends OrderState{
  final List<BookOrderModel> listOdrer;

  OderBookLoaded(this.listOdrer);

  @override
  // TODO: implement props
  List<Object?> get props => [listOdrer];

}

class BookOdrerLoadError extends OrderState{
  final String LoadBookError;

  BookOdrerLoadError(this.LoadBookError);

  @override
  // TODO: implement props
  List<Object?> get props => [LoadBookError];

}


class OrderError extends OrderState{
  String error;

  OrderError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}



