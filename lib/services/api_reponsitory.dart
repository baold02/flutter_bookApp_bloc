import 'package:book_app/models/Book_model.dart';
import 'package:book_app/services/book_api.dart';

class ApiReponsitory{
  final _apiBook = BookApi();
  Future<List<BookModel>> fetchListBook() async {
   var data = await _apiBook.fetchListBook();
   return data;
  }
}