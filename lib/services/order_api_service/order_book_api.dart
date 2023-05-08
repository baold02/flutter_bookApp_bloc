import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/book_order_model.dart';

class OrderBookApi {
  var url = Uri.parse(
      'https://645866ae0c15cb14821d0408.mockapi.io/api/bookOrder');
  Future<List<BookOrderModel>> fetchListBookOrder() async {
    var respone = await http.get(url);
    if (respone.statusCode == 200) {
      final parsed = jsonDecode(utf8.decode(respone.bodyBytes)).cast<Map<String, dynamic>>();
      return parsed.map<BookOrderModel>((json) => BookOrderModel.fromJson(json)).toList();

    } else {
      throw Exception("error");
    }
  }

  Future<http.Response> addOrderBook(String idBook,String name,String image,String price,String des,int quan,
      String  athur) async {
    final bodyData = {
      "idBook": idBook,
      "imgae":image,
      "name": name,
      "athur": athur,
      "price": price,
      "description": des,
      "quantity": quan
    };
    final http.Response respone = await http.post(url,
    body: jsonEncode(bodyData),
    headers: {"Content-Type": "application/json"});
    return respone;
  }

  Future deleteDta(var id) async{
    var url = Uri.parse(
        'https://645866ae0c15cb14821d0408.mockapi.io/api/bookOrder');
    // print('delete');
    final  respone = await http.delete(Uri.parse("${url}/$id"));
    if(respone.statusCode == 200){
      print('ok');
      return true;
    }else{
      print('error');
      return false;
    }
  }
}