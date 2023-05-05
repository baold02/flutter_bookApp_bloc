part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();
}

class BookInitial extends BookState {
  @override
  List<Object> get props => [];
}

class BookLoading extends BookState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class BookLoadSuccess extends BookState{
  final List<BookModel> listBook;
  const BookLoadSuccess(this.listBook);

  @override
  // TODO: implement props
  List<Object?> get props => [listBook];
}

class BookError extends BookState{
  final String error;

  const BookError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];

}
