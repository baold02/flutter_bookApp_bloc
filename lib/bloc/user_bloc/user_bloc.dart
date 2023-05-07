import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import '../../services/user_service/user_api.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserApi _userApi = UserApi();
  UserBloc() : super(UserInitial()) {
    on<AddUser>((event, emit) async {
     http.Response res = await _userApi.addUser(event.name, event.pass, event.phone, event.image, event.address);
     if(res.statusCode == 200){
        print('add succsess');
     }
      // TODO: implement event handler
    });
  }
}
