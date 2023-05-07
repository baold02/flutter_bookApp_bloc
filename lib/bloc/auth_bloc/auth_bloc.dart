import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_app/models/User_model.dart';
import 'package:book_app/services/user_service/user_api.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import '../../services/user_service/api_user_reponsitory.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserApi _userApi = UserApi();
  AuthBloc(AuthState authInitial) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is LoginEvent) {

          await UserApi().fetchUser(event.email, event.password).then((value) =>emit(LoginState(value)));


      }
    });
  }
}
