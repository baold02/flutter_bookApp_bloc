import 'dart:convert';

import 'package:book_app/models/favorite_book_model.dart';
import 'package:http/http.dart' as http;
class FavoriteBookApi{
  var url = Uri.parse('https://6458bad28badff578ef913b7.mockapi.io/api/favorite');
  Future<List<FavoriteBookModel>> fetchListFavorite() async{
    var respone =  await http.get(url);
    if(respone.statusCode == 200){
      final parsed = jsonDecode(utf8.decode(respone.bodyBytes)).cast<Map<String,dynamic>>();
      return parsed.map<FavoriteBookModel>((json) => FavoriteBookModel.fromJson(json)).toList();
    }else{
      throw Exception('error');
    }
  }

  Future<http.Response> AddFavoriteBook(String name,image,price,athur) async {
    final body ={
      "name": name,
      "imgae":image,
      "price": price,
      "athur":athur
    };
      final http.Response respone = await http.post(url,body: jsonEncode(body),
            headers: {"Content-Type":"application/json"}
      );
      return respone;
  }
  Future RemoveFavorite(var id) async{
    var url = 'https://6458bad28badff578ef913b7.mockapi.io/api/favorite';
     final respones= await http.delete(Uri.parse("${url}/$id"));
     if(respones.statusCode == 200){
       print('remove ok');
       return true;
     }else{
       print("error");
       return false;
     }
  }
}