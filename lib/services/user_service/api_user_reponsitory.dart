import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:book_app/models/User_model.dart';
import 'package:book_app/services/user_service/user_api.dart';

class FoodApi {
  var url = Uri.parse('https://6456a23c2e41ccf16921e7e5.mockapi.io/api/user');

  Future<List<UserModel>> fetchUser() async {
    var respone = await http.get(url);
    if (respone.statusCode == 200) {
      final parsed = jsonDecode(utf8.decode(respone.bodyBytes)).cast<
          Map<String, dynamic>>();
      return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception("error");
    }
  }
}