import 'dart:convert';

import 'package:book_app/models/User_model.dart';

import 'package:http/http.dart' as http;

import 'api_user_reponsitory.dart';
class UserApi{
  var url = Uri.parse('https://6456a23c2e41ccf16921e7e5.mockapi.io/api/user');


  Future<http.Response> fetchUser(String email, String pass) async{
    var header = {
      'Client-Service' : 'Ecom',
      'Auth-key': 'Ecom123456',
      'Content-Type': 'application/json'

    };
    var respone = await http.post(url,
    headers: header,
    body: json.encode({
        "name" : email,
        "pass": pass

    })
    );
    if(respone.statusCode == 200){
      var data = json.decode(respone.body);
      print(data.toString());
      return data;

    }else {
      throw Exception("error");
    }
  }
  Future<http.Response> addUser(String name , String pass,String phone, String  imageUser, String assdress) async{
     final bodyData = {
        "name" : name,
        "pass" : pass,
        "phone" : phone,
        "imageUser" : imageUser,
        "assdress" : assdress,
     };

     final http.Response respone = await http.post(url,
     body: jsonEncode(bodyData,),
     headers: {"Content-Type": "application/json"}
     );

     return respone;
  }
}