import 'dart:convert';

import 'package:book_app/models/Book_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BookApi{
 var url = Uri.parse('https://645465f2c18adbbdfeb562e0.mockapi.io/api/book');
 Future<List<BookModel>> fetchListBook() async{
   Response response = await http.get(url);
  if(response.statusCode == 200){
   final parsed = jsonDecode(utf8.decode(response.bodyBytes)).cast<Map<String,dynamic>>();
   return parsed.map<BookModel>((json) => BookModel.fromJson(json)).toList();
  } else{
    throw Exception("error");
  }
 }
}