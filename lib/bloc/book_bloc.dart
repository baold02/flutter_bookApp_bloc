import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_app/models/Book_model.dart';
import 'package:book_app/services/api_reponsitory.dart';
import 'package:equatable/equatable.dart';

import '../services/book_api.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final ApiReponsitory _reponsitory = ApiReponsitory();
  final BookApi _apiBook = BookApi();
  BookBloc() : super(BookInitial()) {
    on<FetchListBook>((event, emit) async {
      try{
         emit(BookLoading());
         final list = await _reponsitory.fetchListBook();
         emit(BookLoadSuccess(list));
      }catch(e){
        emit(const BookError("Error"));
      }
      // TODO: implement event handler
    });
  }
}
