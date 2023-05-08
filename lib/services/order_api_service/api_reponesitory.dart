
import 'package:book_app/services/order_api_service/order_book_api.dart';

import '../../models/book_order_model.dart';

class ApiRepository {
  final _apiBook = OrderBookApi();

  Future<List<BookOrderModel>> fetchListBookOrder() async {
    var data = await _apiBook.fetchListBookOrder();
    return data;
  }
}