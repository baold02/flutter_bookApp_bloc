part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {

  const UserEvent();
}

class AddUser extends UserEvent{
  final String name,pass,phone,image,address;

  const AddUser(this.name, this.pass, this.phone, this.image, this.address);

  @override
  // TODO: implement props
  List<Object?> get props => [name,pass,phone,image,address];

}
