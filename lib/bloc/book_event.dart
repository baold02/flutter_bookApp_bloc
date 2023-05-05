part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();
}


class FetchListBook extends BookEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
