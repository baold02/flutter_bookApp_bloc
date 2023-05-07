part of 'auth_bloc.dart';


abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AthuBlocIsLoadingState extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AthuBlocErrorState extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class LoginState extends AuthState{
  final http.Response res ;
  const LoginState(this.res);

  @override
  // TODO: implement props
  List<Object?> get props => [res];

}
