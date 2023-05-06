import 'package:book_app/models/Book_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
class SearchApi{
  var data = [];
  List<BookModel> results = [];
  String urlList = 'https://645465f2c18adbbdfeb562e0.mockapi.io/api/book';

  Future<List<BookModel>> getuserList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if(response.statusCode == 200){
        final parsed = jsonDecode(utf8.decode(response.bodyBytes)).cast<Map<String,dynamic>>();
        results =  parsed.map<BookModel>((json) => BookModel.fromJson(json)).toList();
        if (query!= null){
          results = results.where((element) => element.name!.toLowerCase().contains((query.toLowerCase()))).toList();
        }
      } else{
        throw Exception("error");
      }

    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}